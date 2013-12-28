package kode.ChatClient;
//@thor lindo
import java.awt.*;
import java.awt.event.*;

import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.*;
import javax.swing.border.*;
import java.net.*;
import java.io.*;

public class ChatClientGUI extends JFrame implements ActionListener {
JLabel header;
JButton send,clear,connect,disconnect;
JTextField ip,port,username;
Socket S;
threadrecieve tr;
JTextArea msg=new JTextArea(),main=new JTextArea();
    public ChatClientGUI() {

        setTitle("ChatClientHC");

        JPanel panel = new JPanel();
		JPanel msgP = new JPanel(new BorderLayout());
		JPanel mains = new JPanel(new FlowLayout());
		JPanel Head = new JPanel(new BorderLayout());
		JPanel sends = new JPanel(new BorderLayout());
		JScrollPane mainscroll = new JScrollPane(main);
		JScrollPane msgscroll = new JScrollPane(msg);
        panel.setBorder(BorderFactory.createEmptyBorder(5, 5, 5, 5));
        panel.setLayout(new BorderLayout());
		main.setLineWrap(true);
		msg.setLineWrap(true);
		mains.add(new JLabel("Host"));
		mains.add(ip=new JTextField(10));
		mains.add(new JLabel("Port"));
		mains.add(port=new JTextField(5));
		mains.add(new JLabel("Username:"));
		mains.add(username = new JTextField(5));
		port.setText("27000");
		port.setEditable(false);
		mains.add(connect=new JButton("Connect"));
		mains.add(disconnect=new JButton("Disconnect"));
		Head.add(mains,BorderLayout.SOUTH);
		Head.add(header=new JLabel("Chat Client"),BorderLayout.NORTH);
		panel.add(Head,BorderLayout.NORTH);
		msgP.add(mainscroll,BorderLayout.CENTER);
		panel.add(msgP,BorderLayout.CENTER);
		sends.setBorder(BorderFactory.createEmptyBorder(5, 5, 5, 5));
		sends.add(msgscroll,BorderLayout.CENTER);
		sends.add(send=new JButton("Kirim"),BorderLayout.EAST);
		panel.add(sends,BorderLayout.SOUTH);
		
		sends.setPreferredSize(new Dimension(100,100));
		
		main.setEditable(false);
		disconnect.setEnabled(false);
		connect.addActionListener(this);
		send.addActionListener(this);
		disconnect.addActionListener(this);
		
        addWindowListener(new WindowAdapter()
		{
		public void windowClosing(WindowEvent we)
		{
		try{
		PrintWriter pw = new PrintWriter(S.getOutputStream());
		pw.println("0x007");
		pw.flush();

		System.exit(0);
		}
		catch(Exception E) {}
		}

		}
		);
        add(panel);

        setSize(640, 480);
		this.setResizable(false);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        setVisible(true);

		
    }
	
	public void actionPerformed(ActionEvent ae)
	{
	String str = ae.getActionCommand();
	
	if(str.equals("Connect") && username.getText().length()>=1)
	{
	
	try
	{
	S = new Socket(ip.getText(),27000);
	PrintWriter pw = new PrintWriter(S.getOutputStream());
	pw.println(username.getText());
	pw.flush();
	BufferedReader br = new BufferedReader(new InputStreamReader(S.getInputStream()));
	String ms=br.readLine();
	if(ms.equals("ok"))
	{
	tr = new threadrecieve(S);
	tr.start();
	connect.setEnabled(false);
	disconnect.setEnabled(true);
	username.setEditable(false);
	ip.setEditable(false);
	}
	else
	{
	S.close();
	JOptionPane.showMessageDialog(null, "Nama telah digunakan","Error", JOptionPane.ERROR_MESSAGE); 	
	}
	
	}
	catch(Exception E)
	{
	JOptionPane.showMessageDialog(null, E.toString(),"Error", JOptionPane.ERROR_MESSAGE); 	
	}
	}	
	
	if(str.equals("Disconnect"))
	{
	try {
	
	PrintWriter pw = new PrintWriter(S.getOutputStream());
	pw.println("0x007");
	pw.flush();
	connect.setEnabled(true);
	disconnect.setEnabled(false);
	username.setEditable(true);
	ip.setEditable(true);
	}
	catch(Exception E)
	{
	
	}
	}
	
	if(str.equals("Kirim"))
	{
	try
	{
	PrintWriter pw = new PrintWriter(S.getOutputStream());
	pw.println(msg.getText());
	pw.flush();
	msg.setText("");
	}
	catch(Exception E)
	{
	}
	}
	}	
	public class threadrecieve extends Thread
	{
	Socket S;
	String msg;
	BufferedReader br;
	threadrecieve(Socket r)
	{
	S=r;
	}
	
	public void run()
	{
	try
	{
	System.out.println("rock");
	br = new BufferedReader(new InputStreamReader(S.getInputStream()));
	while((msg=br.readLine())!=null)
		{	System.out.println(msg);			
			ChatClientGUI.this.main.append(msg+"\n");
			if(msg.equals("Server is Shutting Down"))
			{
			username.setEditable(true);
			ip.setEditable(true);
			disconnect.setEnabled(false);
			connect.setEnabled(true);
			break;
			}
		
		}
	S.close();
	br.close();
	}
	catch(Exception E){ }
	}
	
	}
	
	
	

    public static void main(String[] args) {
        new ChatClientGUI();
    }
}
