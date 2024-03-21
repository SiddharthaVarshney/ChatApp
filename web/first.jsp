<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>First Person</title>
    <link rel="stylesheet" href="style.css">
    <%@ page import="java.net.*, java.io.*"%>
</head>
<body>
    <script>
        function get(){
            var m=document.getElementById("textarea1").value;
            window.location.replace("first.jsp?out_msg="+m);
        }
    </script>
    <%
    try{
        Socket s = new Socket("localhost", 6969);
        DataInputStream din = new DataInputStream(s.getInputStream());
        DataOutputStream dout = new DataOutputStream(s.getOutputStream());

        String out_msg = "", in = "";
        while (!in.equals("stop")) {
            out_msg = request.getParameter("out_msg");
            dout.writeUTF(out_msg);
            dout.flush();
            in = din.readUTF();
            out.println(in);
        }
        dout.close();
        s.close();
        }catch(Exception e){ out.println("");}
    %>
    <div class="whole-card">
        <h2 class='smaller-heading'>First Person</h2>
        <textarea id='textarea1' name='first-text' rows='25' cols='80' ></textarea>
        <button class='btn' id='btn1'onclick="get();">Enter</button>
    </div>
</body>
</html>