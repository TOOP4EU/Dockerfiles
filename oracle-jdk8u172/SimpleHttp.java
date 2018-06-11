import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

/**
 * A very simple, dummy http server that says : JRE IS UP with date.
 */
public class SimpleHttp {

  static Executor executor = Executors.newFixedThreadPool(10);

  /**
   * call with empty args for port 80, or give the port
   */
  public static void main(String[] args) throws Exception {
    ServerSocket serverSocket = new ServerSocket();

    Runtime.getRuntime().addShutdownHook(new Thread(() -> {
      System.out.println("Close the server");
      try {
        serverSocket.close();
      } catch (IOException e) {
      }
    }));

    int port = 8081;
    if (args.length != 0) {
      try {
        port = Integer.parseInt(args[0]);
      } catch (Exception ex) {
        System.err.println("Invalid port " + args[0]);
        System.exit(-1);
      }
    }

    serverSocket.bind(new InetSocketAddress(port));

    byte[] httpOk = "HTTP/1.1 200 OK\n\n".getBytes(StandardCharsets.UTF_8);
    byte[] jreIsUp = " - JRE8 IS UP\n".getBytes(StandardCharsets.UTF_8);
    byte[] javaVersion = getJavaVersion();

    System.out.println(new String(javaVersion));
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
    try {
      while (true) {
        final Socket accept = serverSocket.accept();
        executor.execute(() -> {
          try {
            InputStream is = accept.getInputStream();
            accept.setSoTimeout(10000);
            BufferedReader br = new BufferedReader(new InputStreamReader(is));
            br.readLine();
            OutputStream outputStream = accept.getOutputStream();
            outputStream.write(httpOk);
            String time = simpleDateFormat.format(new Date());
            outputStream.write(time.getBytes(StandardCharsets.UTF_8));
            outputStream.write(jreIsUp);
            outputStream.write(javaVersion);
            outputStream.flush();
            outputStream.close();
            System.out.println(new Date());
          } catch (Exception ex) {
            ex.printStackTrace();
          }
        });
      }
    } catch (Exception ex) {
      ex.printStackTrace();
    }
  }

  /**
   * execute "java -version" and return the output.
   * not using System.getProperty("java.version").
   *
   * @return
   */
  private static byte[] getJavaVersion() throws IOException, InterruptedException {

    Process exec = Runtime.getRuntime().exec("java -version");

    StringBuilder builder = new StringBuilder();

    consumeStream(builder, exec.getInputStream());
    consumeStream(builder, exec.getErrorStream());

    exec.waitFor();

    return builder.toString().getBytes(StandardCharsets.UTF_8);
  }

  private static void consumeStream(StringBuilder builder, InputStream errorStream) throws IOException {
    BufferedReader br = new BufferedReader(new InputStreamReader(errorStream));

    String line;
    while((line = br.readLine()) != null){
      builder.append(line).append('\n');
    }
  }
}
