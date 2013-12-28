package kode.ChatServer;
//@thor lindo
import java.awt.*;
import java.awt.event.*;


import javax.swing.*;
import javax.swing.border.*;
import java.net.*;
import java.io.*;
import java.util.*;

public class ChatServerGUI extends JFrame implements ActionListener {

    private static final long serialVersionUID = 7526472295622776147L;
    JLabel header;
    JButton send, clear, start, stop;
    JTextField port;
    JList userListBox;
    DefaultListModel userList;
    threadserver ts;
    int no_of_users;
    boolean serverState = false;
    String com;
    Vector<Socket> SocketClients = new Vector<Socket>();
    JTextArea msg = new JTextArea(), main = new JTextArea();
    ServerSocket SS;
    Socket C;

    public ChatServerGUI() {

        setTitle("ChatServer");

        JPanel panel = new JPanel();
        JPanel msgP = new JPanel(new BorderLayout());
        JPanel mains = new JPanel(new FlowLayout());
        JPanel Head = new JPanel(new BorderLayout());
        JPanel sends = new JPanel(new BorderLayout());
        JPanel userPane = new JPanel(new BorderLayout());
        userList = new DefaultListModel();
        userListBox = new JList(userList);

        JPanel msgbuttons = new JPanel(new GridLayout(0, 2, 5, 5));
        JScrollPane mainscroll = new JScrollPane(main);
        JScrollPane msgscroll = new JScrollPane(msg);

        userPane.add(new JScrollPane(userListBox), BorderLayout.CENTER);
        userPane.add(new JLabel("USER LIST", JLabel.CENTER), BorderLayout.NORTH);
        panel.setBorder(BorderFactory.createEmptyBorder(5, 5, 5, 5));
        panel.setLayout(new BorderLayout());

        panel.add(userPane, BorderLayout.EAST);
        main.setLineWrap(true);
        msg.setLineWrap(true);
        mains.add(new JLabel("Port"));
        mains.add(port = new JTextField(5));
        mains.add(start = new JButton("StartService"));
        mains.add(stop = new JButton("StopService"));
        stop.setEnabled(false);
        port.setText("27000");
        port.setEditable(false);
        Head.add(mains, BorderLayout.SOUTH);
        Head.add(header = new JLabel("Chat Server HC"), BorderLayout.NORTH);
        panel.add(Head, BorderLayout.NORTH);
        msgP.add(mainscroll, BorderLayout.CENTER);
        panel.add(msgP, BorderLayout.CENTER);
        sends.setBorder(BorderFactory.createEmptyBorder(5, 5, 5, 5));
        sends.add(msgscroll, BorderLayout.CENTER);
        sends.add(msgbuttons, BorderLayout.EAST);
        msgbuttons.add(send = new JButton("Kirim"));

        msgbuttons.add(clear = new JButton("Clear"));

        panel.add(sends, BorderLayout.SOUTH);

        sends.setPreferredSize(new Dimension(50, 50));
        main.setEditable(false);
        add(panel);
        setSize(640, 480);
        this.setResizable(false);

        start.addActionListener(this);
        stop.addActionListener(this);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent we) {
                try {
                    Socket dummy;
                    PrintWriter pw;
                    for (int i = 0; i < SocketClients.size(); i++) {
                        dummy = (Socket) SocketClients.get(i);
                        pw = new PrintWriter(dummy.getOutputStream());
                        pw.println("Server is Shutting Down");
                        pw.flush();
                    }
                    System.exit(0);
                } catch (Exception E) {
                }
            }
        });
        setVisible(true);
        try {
            Thread.sleep(1000);
            main.append("Selamat Datang diChat Hacker Community, \n");
            main.append("tunggu sebentar...\n");
            Thread.sleep(2000);
            main.append("Click StartService untuk memonitoring port 27000\n");
        } catch (Exception E) {
        }

        send.addActionListener(this);



    }

    public void actionPerformed(ActionEvent ae) {
        String str = ae.getActionCommand();

        if (str.equals("StartService")) {
            try {
                JOptionPane.showMessageDialog(null, "Running!", "Server telah berjalan", JOptionPane.INFORMATION_MESSAGE);
                serverState = true;
                SS = new ServerSocket(27000);
                ts = new threadserver(SS);
                ts.start();
                stop.setEnabled(true);
                start.setEnabled(false);
            } catch (Exception E) {
            }
        }

        if (str.equals("StopService")) {
            try {
                Socket dummy;
                PrintWriter pw;
                serverState = false;
                main.setText(main.getText() + "\n===SERVER CLOSED===\n");
                for (int i = 0; i < SocketClients.size(); i++) {
                    dummy = (Socket) SocketClients.get(i);
                    pw = new PrintWriter(dummy.getOutputStream());
                    pw.println("Server is Shutting Down");
                    pw.flush();
                }

                userList.clear();
                SocketClients.clear();

                SS.close();
                start.setEnabled(true);
                stop.setEnabled(false);

            } catch (Exception E) {
            }
        }
        if (str.equals("Kirim")) {
            PrintWriter pw;

            try {
                Socket dummy;
                for (int i = 0; i < SocketClients.size(); i++) {
                    dummy = (Socket) SocketClients.get(i);
                    pw = new PrintWriter(dummy.getOutputStream());
                    pw.println(">>>>>>>>SERVER:" + msg.getText());
                    main.append(">>>>>>>>SERVER:" + msg.getText() + "\n");
                    msg.setText("");
                    pw.flush();
                }

            } catch (Exception E) {
            }
        }
    }

    public class threadserver extends Thread {

        ServerSocket s;
        Socket C;

        threadserver(ServerSocket k) {
            s = k;
        }

        public void run() {
            boolean proceed = true;
            no_of_users = 0;
            try {
                ChatServerGUI.this.main.append(">Bersiap menerima client\n");
                while (true) {
                    C = s.accept();
                    no_of_users++;
                    BufferedReader br = new BufferedReader(new InputStreamReader(C.getInputStream()));
                    PrintWriter pw = new PrintWriter(C.getOutputStream());
                    String ms = br.readLine();

                    for (int i = 0; i < userList.size(); i++) {
                        if (ms.equalsIgnoreCase((String) userList.get(i))) {
                            pw.println("not ok");
                            pw.flush();
                            C.close();
                            proceed = false;
                            break;
                        }
                        proceed = true;
                    }


                    if (proceed) {
                        pw.println("ok");
                        pw.flush();
                        SocketClients.add(C);
                        threadclient client;
                        client = new threadclient(C);
                        client.setName(ms);
                        client.start();
                    }
                }
            } catch (Exception E) {
            }
        }
    }

    public class threadclient extends Thread {

        Socket c;
        Socket dummy;
        String msg;
        BufferedReader br;
        PrintWriter pw;
        boolean clientStatus;

        threadclient(Socket S) {
            c = S;
        }

        public void run() {
            try {

                System.out.println("texting");
                br = new BufferedReader(new InputStreamReader(c.getInputStream()));
                pw = new PrintWriter(c.getOutputStream());
                pw.println("Selamat Datang diChat Hacker Community");
                pw.println("Username Anda:" + this.getName());
                pw.flush();

                for (int j = 0; j < SocketClients.size(); j++) {
                    dummy = (Socket) SocketClients.get(j);
                    pw = new PrintWriter(dummy.getOutputStream());
                    pw.println(this.getName() + " telah bergabung pada chat");
                    pw.flush();

                }
                System.out.println(c);
                userList.addElement((String) this.getName());
                while (ChatServerGUI.this.serverState) {
                    if ((msg = br.readLine()) != null) {

                        if (msg.equals("0x007")) {
                            pw.println("Chat anda telah Disconnected dari server");
                            pw.flush();
                            com = this.getName();
                            SocketClients.removeElement(c);
                            for (int i = 0; i < SocketClients.size(); i++) {

                                dummy = (Socket) SocketClients.get(i);

                                pw = new PrintWriter(dummy.getOutputStream());
                                pw.println(ChatServerGUI.this.com + " telah meninggalkan chat");
                                pw.flush();

                            }
                            break;
                        } else if (msg.equals("**users")) {
                            pw.println("\n****USERS****");
                            for (int i = 0; i < userList.size(); i++) {
                                pw.println((String) userList.get(i));
                            }
                            pw.println();
                            pw.flush();
                        } else {
                            System.out.println(msg);
                            msg = this.getName() + ":  " + msg;
                            System.out.println(msg);
                            ChatServerGUI.this.main.append(msg + "\n");
                            for (int i = 0; i < ChatServerGUI.this.SocketClients.size(); i++) {
                                dummy = (Socket) SocketClients.get(i);
                                pw = new PrintWriter(dummy.getOutputStream());
                                pw.println(msg);
                                //System.out.println(msg);
                                pw.flush();
                            }
                        }
                    }

                }
                System.out.println("exiting " + this.getName());
                c.close();
                br.close();

                ChatServerGUI.this.main.append(">>" + this.getName() + " telah meninggalkan chat\n");
                for (int j = 0; j < SocketClients.size(); j++) {
                    System.out.println(SocketClients.get(j));
                }
                userList.removeElement(this.getName());
            } catch (Exception E) {
                E.printStackTrace();
            }

        }
    }

    public static void main(String[] args) {
        new ChatServerGUI();
    }
}
