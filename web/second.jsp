<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Second Person</title>
    <link rel="stylesheet" href="style.css">
    <%@ page import="java.net.*, java.io.*"%>
</head>
<body>
    <script>
     function get(){
            var m=document.getElementById("textarea2").value;
            window.location.replace("second.jsp?out_msg="+m);
        }
    </script>
    <%
    try{
        ServerSocket ss = new ServerSocket(6969);
        Socket s = ss.accept();
        DataInputStream din = new DataInputStream(s.getInputStream());
        DataOutputStream dout = new DataOutputStream(s.getOutputStream());
        String in = "", out_msg = "";
        while (!in.equals("stop")) {
            in = din.readUTF();
            out.println("First: " + in);
            out_msg = request.getParameter("out_msg");;
            dout.writeUTF(out_msg);
            dout.flush();
        }
        dout.close();
        ss.close();
    }catch(Exception e){
        out.println("");
    }
    %>
    <div class="whole-card">
        <h2 class='smaller-heading'>Second Person</h2>
        <textarea name='first-text' rows='25' cols='80' id='textarea2' ></textarea>
        <button class='btn' id='btn2' onclick="get();" >Enter</button>
    </div>
</body>
</html>