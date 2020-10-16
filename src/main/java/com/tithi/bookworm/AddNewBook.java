/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tithi.bookworm;

import java.awt.Color;
import java.awt.Font;
import java.awt.Image;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.imageio.ImageIO;
import javax.swing.DefaultListModel;
import javax.swing.ImageIcon;
import javax.swing.JEditorPane;
import javax.swing.JOptionPane;

/**
 *
 * @author ASUS
 */
public class AddNewBook extends javax.swing.JFrame {

    DataBaseConnection db; boolean edit = false;
    String genre, bookName, authorName, description, releaseDate, releaseDate2;
    List edit_genre;
    List days_30;
    static int id = 0;
    
    public AddNewBook(int id) {
        this.id = id;
        db = new DataBaseConnection();
        edit_genre = new ArrayList <String>();
        initComponents();
        setContentPane(new javax.swing.JLabel(new ImageIcon("src/main/resources/Backgrounds/shade6.png")));
        setDays(); 
        setStuff();
        if(id != 0) {setStuff2(); edit = true;}
        addStuff();
    }
    
    private void addStuff(){
        add(jLabel19);add(jLabel20);add(bookNameField);add(authorNameField);
        add(jLabel21);add(jLabel22);add(jLabel23);add(jLabel24);add(jLabel25);
        add(jLabel25);add(jLabel26);add(jLabel27);add(jLabel28);
        add(jTextField5);add(jTextField6);add(jScrollPane4); add(jPanel1);
    }
    
    private void setStuff2(){
        try {
            jLabel27.setText("Edit A Book");
            db.rs = db.stmt.executeQuery("select * from book where book_id = "+id);
            while(db.rs.next()){
                bookNameField.setText(db.rs.getString("book_name"));
                authorNameField.setText(db.rs.getString("author_name"));
                descriptionField.setText(db.rs.getString("description"));
                releaseDate2 = new SimpleDateFormat("dd-MMM-yyyy").format(db.rs.getDate("release_date"));
                jTextField5.setText(releaseDate2);
            }
            db.rs = db.stmt.executeQuery("select genre_id from book_genre where book_id = "+id);
            genre = "";
            if(db.rs.next()) {
                db.rs2 = db.stmt2.executeQuery("select genre_name from genre where genre_id = "+db.rs.getInt("genre_id"));
                if(db.rs2.next()) {genre = genre + db.rs2.getString("genre_name"); edit_genre.add(db.rs2.getString("genre_name"));}
            }
            while(db.rs.next()) {
                db.rs2 = db.stmt2.executeQuery("select genre_name from genre where genre_id = "+db.rs.getInt("genre_id"));
                if(db.rs2.next()) {genre = genre + ", " + db.rs2.getString("genre_name");edit_genre.add(db.rs2.getString("genre_name"));}
            }
            jTextField6.setText(genre);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    private void setStuff(){
        try {
            jPanel1.setVisible(false);
            jLabel19.setIcon(new ImageIcon(ImageIO.read(new java.io.File("src/main/resources/Icons/purple cancel.png")
            ).getScaledInstance(jLabel19.getWidth(), jLabel19.getHeight(),
                    Image.SCALE_SMOOTH)));
            jLabel21.setIcon(new ImageIcon(ImageIO.read(new java.io.File("src/main/resources/Icons/purple tick.png")
            ).getScaledInstance(jLabel21.getWidth(), jLabel21.getHeight(),
                    Image.SCALE_SMOOTH)));
            jLabel29.setIcon(new ImageIcon(ImageIO.read(new java.io.File("src/main/resources/Icons/purple tick.png")
            ).getScaledInstance(59, 60,
                    Image.SCALE_SMOOTH)));
            jDialog1.setLocationRelativeTo(null);
            jDialog1.getContentPane().setBackground(new Color(153,153,255));
            jDialog2.getContentPane().setBackground(new Color(153,153,255));
            jDialog2.setLocationRelativeTo(null);
            jList1.setFont(new Font("Footlight MT Light", Font.PLAIN, 22));
            jList1.setForeground(new Color(102,0,153));
            jList2.setFont(new Font("Footlight MT Light", Font.PLAIN, 22));
            jList2.setForeground(new Color(102,0,153));
            jTextField6.setEditable(false);jTextField5.setEditable(false);
        } catch (IOException ex) {
            ex.printStackTrace();
        }
            
    }
    
    private void setDays(){
        days_30 = new ArrayList();
        days_30.add("Sep");
        days_30.add("Apr");
        days_30.add("Jun");
        days_30.add("Nov");
    }
    
    public static int getContentHeight(String content) {
        JEditorPane dummyEditorPane=new JEditorPane();
        dummyEditorPane.setSize(192,Short.MAX_VALUE);
        dummyEditorPane.setText(content);
        
        return dummyEditorPane.getPreferredSize().height;
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jDialog1 = new javax.swing.JDialog();
        jLabel29 = new javax.swing.JLabel();
        jLabel30 = new javax.swing.JLabel();
        jScrollPane2 = new javax.swing.JScrollPane();
        jList1 = new javax.swing.JList();
        jScrollPane3 = new javax.swing.JScrollPane();
        jList2 = new javax.swing.JList();
        jLabel33 = new javax.swing.JLabel();
        jLabel34 = new javax.swing.JLabel();
        jLabel35 = new javax.swing.JLabel();
        jDialog2 = new javax.swing.JDialog();
        jLabel31 = new javax.swing.JLabel();
        jLabel32 = new javax.swing.JLabel();
        jLabel36 = new javax.swing.JLabel();
        Day = new javax.swing.JComboBox();
        Mon = new javax.swing.JComboBox();
        jButton1 = new javax.swing.JButton();
        Year = new javax.swing.JTextField();
        bookNameField = new javax.swing.JTextField();
        jLabel19 = new javax.swing.JLabel();
        jLabel20 = new javax.swing.JLabel();
        jLabel21 = new javax.swing.JLabel();
        jLabel22 = new javax.swing.JLabel();
        jLabel23 = new javax.swing.JLabel();
        jLabel24 = new javax.swing.JLabel();
        jLabel25 = new javax.swing.JLabel();
        jLabel26 = new javax.swing.JLabel();
        jLabel27 = new javax.swing.JLabel();
        authorNameField = new javax.swing.JTextField();
        jLabel28 = new javax.swing.JLabel();
        jTextField5 = new javax.swing.JTextField();
        jTextField6 = new javax.swing.JTextField();
        jScrollPane4 = new javax.swing.JScrollPane();
        descriptionField = new javax.swing.JEditorPane();
        jPanel1 = new javax.swing.JPanel();

        jDialog1.setBackground(new java.awt.Color(153, 153, 255));
        jDialog1.setUndecorated(true);
        jDialog1.setSize(new java.awt.Dimension(750, 818));
        jDialog1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jDialog1MouseClicked(evt);
            }
        });

        jLabel29.setText("Label21");
        jLabel29.setPreferredSize(new java.awt.Dimension(59, 60));
        jLabel29.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabel29MouseClicked(evt);
            }
        });

        jLabel30.setFont(new java.awt.Font("Calibri Light", 0, 20)); // NOI18N
        jLabel30.setForeground(new java.awt.Color(102, 0, 153));
        jLabel30.setText("Done");

        jList1.setBackground(new java.awt.Color(204, 204, 255));
        jScrollPane2.setViewportView(jList1);

        jList2.setBackground(new java.awt.Color(204, 204, 255));
        jScrollPane3.setViewportView(jList2);

        jLabel33.setBackground(javax.swing.UIManager.getDefaults().getColor("Button.darkShadow"));
        jLabel33.setFont(new java.awt.Font("Old English Text MT", 0, 26)); // NOI18N
        jLabel33.setForeground(new java.awt.Color(102, 0, 153));
        jLabel33.setText("Select Genre");

        jLabel34.setFont(new java.awt.Font("Calibri Light", 0, 20)); // NOI18N
        jLabel34.setForeground(new java.awt.Color(102, 0, 153));
        jLabel34.setText("Add");
        jLabel34.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabel34MouseClicked(evt);
            }
        });

        jLabel35.setFont(new java.awt.Font("Calibri Light", 0, 20)); // NOI18N
        jLabel35.setForeground(new java.awt.Color(102, 0, 153));
        jLabel35.setText("Remove");
        jLabel35.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabel35MouseClicked(evt);
            }
        });

        javax.swing.GroupLayout jDialog1Layout = new javax.swing.GroupLayout(jDialog1.getContentPane());
        jDialog1.getContentPane().setLayout(jDialog1Layout);
        jDialog1Layout.setHorizontalGroup(
            jDialog1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jDialog1Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jLabel29, javax.swing.GroupLayout.PREFERRED_SIZE, 59, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(12, 12, 12)
                .addComponent(jLabel30)
                .addGap(58, 58, 58))
            .addGroup(jDialog1Layout.createSequentialGroup()
                .addGap(46, 46, 46)
                .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 209, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGroup(jDialog1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jDialog1Layout.createSequentialGroup()
                        .addGap(96, 96, 96)
                        .addComponent(jLabel34)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 109, Short.MAX_VALUE))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jDialog1Layout.createSequentialGroup()
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(jLabel35)
                        .addGap(84, 84, 84)))
                .addComponent(jScrollPane3, javax.swing.GroupLayout.PREFERRED_SIZE, 211, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(48, 48, 48))
            .addGroup(jDialog1Layout.createSequentialGroup()
                .addGap(304, 304, 304)
                .addComponent(jLabel33)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jDialog1Layout.setVerticalGroup(
            jDialog1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jDialog1Layout.createSequentialGroup()
                .addGroup(jDialog1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jDialog1Layout.createSequentialGroup()
                        .addGap(172, 172, 172)
                        .addGroup(jDialog1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 486, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jScrollPane3, javax.swing.GroupLayout.PREFERRED_SIZE, 486, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addGroup(jDialog1Layout.createSequentialGroup()
                        .addGap(61, 61, 61)
                        .addComponent(jLabel33)
                        .addGap(235, 235, 235)
                        .addComponent(jLabel34)
                        .addGap(62, 62, 62)
                        .addComponent(jLabel35)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 32, Short.MAX_VALUE)
                .addGroup(jDialog1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel29, javax.swing.GroupLayout.PREFERRED_SIZE, 61, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(jDialog1Layout.createSequentialGroup()
                        .addGap(19, 19, 19)
                        .addComponent(jLabel30)))
                .addGap(31, 31, 31))
        );

        jDialog2.setBackground(new java.awt.Color(153, 153, 255));
        jDialog2.setUndecorated(true);
        jDialog2.setSize(new java.awt.Dimension(504, 213));

        jLabel31.setFont(new java.awt.Font("Footlight MT Light", 0, 20)); // NOI18N
        jLabel31.setForeground(new java.awt.Color(102, 0, 153));
        jLabel31.setText("Day:");

        jLabel32.setFont(new java.awt.Font("Footlight MT Light", 0, 20)); // NOI18N
        jLabel32.setForeground(new java.awt.Color(102, 0, 153));
        jLabel32.setText("Month:");

        jLabel36.setFont(new java.awt.Font("Footlight MT Light", 0, 20)); // NOI18N
        jLabel36.setForeground(new java.awt.Color(102, 0, 153));
        jLabel36.setText("Year:");

        Day.setFont(new java.awt.Font("Footlight MT Light", 0, 20)); // NOI18N
        Day.setForeground(new java.awt.Color(102, 0, 153));
        Day.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31" }));

        Mon.setFont(new java.awt.Font("Footlight MT Light", 0, 20)); // NOI18N
        Mon.setForeground(new java.awt.Color(102, 0, 153));
        Mon.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" }));

        jButton1.setBackground(new java.awt.Color(204, 204, 255));
        jButton1.setFont(new java.awt.Font("Footlight MT Light", 0, 20)); // NOI18N
        jButton1.setForeground(new java.awt.Color(102, 0, 153));
        jButton1.setText("OK");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        Year.setFont(new java.awt.Font("Footlight MT Light", 0, 20)); // NOI18N
        Year.setForeground(new java.awt.Color(102, 0, 153));
        Year.setText("YYYY");
        Year.setSelectionColor(new java.awt.Color(255, 204, 255));

        javax.swing.GroupLayout jDialog2Layout = new javax.swing.GroupLayout(jDialog2.getContentPane());
        jDialog2.getContentPane().setLayout(jDialog2Layout);
        jDialog2Layout.setHorizontalGroup(
            jDialog2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jDialog2Layout.createSequentialGroup()
                .addGap(35, 35, 35)
                .addComponent(jLabel32)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(Mon, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(47, 47, 47)
                .addComponent(jLabel31)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(Day, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(61, 61, 61)
                .addGroup(jDialog2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jButton1)
                    .addGroup(jDialog2Layout.createSequentialGroup()
                        .addComponent(jLabel36)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(Year, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(33, Short.MAX_VALUE))
        );
        jDialog2Layout.setVerticalGroup(
            jDialog2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jDialog2Layout.createSequentialGroup()
                .addGap(91, 91, 91)
                .addGroup(jDialog2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel31)
                    .addComponent(Day, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel36)
                    .addComponent(Year, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel32)
                    .addComponent(Mon, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 45, Short.MAX_VALUE)
                .addComponent(jButton1)
                .addGap(25, 25, 25))
        );

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setUndecorated(true);
        setSize(new java.awt.Dimension(750, 800));

        bookNameField.setFont(new java.awt.Font("Footlight MT Light", 0, 20)); // NOI18N
        bookNameField.setForeground(new java.awt.Color(0, 102, 153));
        bookNameField.setCaretColor(new java.awt.Color(0, 102, 153));
        bookNameField.setOpaque(false);
        bookNameField.setSelectionColor(new java.awt.Color(255, 204, 255));

        jLabel19.setText("jLabel19");
        jLabel19.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabel19MouseClicked(evt);
            }
        });

        jLabel20.setFont(new java.awt.Font("Footlight MT Light", 0, 20)); // NOI18N
        jLabel20.setForeground(new java.awt.Color(102, 0, 153));
        jLabel20.setText("Cancel");
        jLabel20.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabel20MouseClicked(evt);
            }
        });

        jLabel21.setText("Label21");
        jLabel21.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabel21MouseClicked(evt);
            }
        });

        jLabel22.setFont(new java.awt.Font("Footlight MT Light", 0, 20)); // NOI18N
        jLabel22.setForeground(new java.awt.Color(102, 0, 153));
        jLabel22.setText("Done");
        jLabel22.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabel22MouseClicked(evt);
            }
        });

        jLabel23.setFont(new java.awt.Font("Footlight MT Light", 0, 20)); // NOI18N
        jLabel23.setForeground(new java.awt.Color(102, 0, 153));
        jLabel23.setText("Book Name:");

        jLabel24.setFont(new java.awt.Font("Footlight MT Light", 0, 20)); // NOI18N
        jLabel24.setForeground(new java.awt.Color(102, 0, 153));
        jLabel24.setText("Author's Name:");

        jLabel25.setFont(new java.awt.Font("Footlight MT Light", 0, 20)); // NOI18N
        jLabel25.setForeground(new java.awt.Color(102, 0, 153));
        jLabel25.setText("Release Date:");

        jLabel26.setFont(new java.awt.Font("Footlight MT Light", 0, 20)); // NOI18N
        jLabel26.setForeground(new java.awt.Color(102, 0, 153));
        jLabel26.setText("Genre:");

        jLabel27.setBackground(javax.swing.UIManager.getDefaults().getColor("Button.darkShadow"));
        jLabel27.setFont(new java.awt.Font("Old English Text MT", 0, 24)); // NOI18N
        jLabel27.setForeground(new java.awt.Color(102, 0, 153));
        jLabel27.setText("Add A New Book");

        authorNameField.setFont(new java.awt.Font("Footlight MT Light", 0, 20)); // NOI18N
        authorNameField.setForeground(new java.awt.Color(0, 102, 153));
        authorNameField.setCaretColor(new java.awt.Color(0, 102, 153));
        authorNameField.setOpaque(false);
        authorNameField.setSelectionColor(new java.awt.Color(255, 204, 255));

        jLabel28.setFont(new java.awt.Font("Footlight MT Light", 0, 20)); // NOI18N
        jLabel28.setForeground(new java.awt.Color(102, 0, 153));
        jLabel28.setText("Description:");

        jTextField5.setFont(new java.awt.Font("Footlight MT Light", 0, 20)); // NOI18N
        jTextField5.setForeground(new java.awt.Color(0, 102, 153));
        jTextField5.setCaretColor(new java.awt.Color(0, 102, 153));
        jTextField5.setOpaque(false);
        jTextField5.setSelectionColor(new java.awt.Color(255, 204, 255));
        jTextField5.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jTextField5MouseClicked(evt);
            }
        });
        jTextField5.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                jTextField5KeyPressed(evt);
            }
        });

        jTextField6.setFont(new java.awt.Font("Footlight MT Light", 0, 20)); // NOI18N
        jTextField6.setForeground(new java.awt.Color(0, 102, 153));
        jTextField6.setCaretColor(new java.awt.Color(0, 102, 153));
        jTextField6.setOpaque(false);
        jTextField6.setSelectionColor(new java.awt.Color(255, 204, 255));
        jTextField6.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jTextField6MouseClicked(evt);
            }
        });
        jTextField6.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                jTextField6KeyPressed(evt);
            }
        });

        jScrollPane4.setHorizontalScrollBarPolicy(javax.swing.ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);

        descriptionField.setFont(new java.awt.Font("Footlight MT Light", 0, 20)); // NOI18N
        descriptionField.setForeground(new java.awt.Color(0, 102, 153));
        descriptionField.setCaretColor(new java.awt.Color(0, 102, 153));
        descriptionField.setPreferredSize(new java.awt.Dimension(175, 140));
        descriptionField.setSelectionColor(new java.awt.Color(255, 204, 255));
        jScrollPane4.setViewportView(descriptionField);

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 438, Short.MAX_VALUE)
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 128, Short.MAX_VALUE)
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(288, 288, 288)
                .addComponent(jLabel27)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(97, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(jLabel24)
                            .addComponent(jLabel25, javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel26, javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel28, javax.swing.GroupLayout.Alignment.LEADING))
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                            .addComponent(jTextField6, javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jTextField5, javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(authorNameField, javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(bookNameField)
                            .addComponent(jScrollPane4, javax.swing.GroupLayout.PREFERRED_SIZE, 407, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabel19, javax.swing.GroupLayout.PREFERRED_SIZE, 59, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(12, 12, 12)
                                .addComponent(jLabel20)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(jLabel21, javax.swing.GroupLayout.PREFERRED_SIZE, 59, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(12, 12, 12)
                                .addComponent(jLabel22))))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(113, 113, 113)
                        .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(jLabel23))
                .addGap(102, 102, 102))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(68, 68, 68)
                .addComponent(jLabel27)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel23)
                    .addComponent(bookNameField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(27, 27, 27)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel24)
                    .addComponent(authorNameField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(27, 27, 27)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel25)
                    .addComponent(jTextField5, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(24, 24, 24)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel26)
                    .addComponent(jTextField6, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(29, 29, 29)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel28)
                    .addComponent(jScrollPane4, javax.swing.GroupLayout.PREFERRED_SIZE, 140, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 78, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel21, javax.swing.GroupLayout.PREFERRED_SIZE, 61, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel19, javax.swing.GroupLayout.PREFERRED_SIZE, 61, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(19, 19, 19)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel22)
                            .addComponent(jLabel20))))
                .addGap(79, 79, 79))
        );

        pack();
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void jLabel19MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel19MouseClicked
        this.setVisible(false);this.dispose();
        if(edit) new ViewBooks().setVisible(true);
        else new BookManagement().setVisible(true);
    }//GEN-LAST:event_jLabel19MouseClicked

    private void jLabel21MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel21MouseClicked
        try {
            if(bookNameField.getText().equals("")||authorNameField.getText().equals("")||
                    jTextField5.getText().equals("")||jTextField6.getText().equals("")||descriptionField.getText().equals("")){
                JOptionPane.showMessageDialog(null, "Input can't be empty"); return;
            }
            bookName = "'"+bookNameField.getText()+"'";
            authorName = "'"+authorNameField.getText()+"'";
            description = "'"+descriptionField.getText()+"'";
            releaseDate = "'"+releaseDate2+"'";
            String query;
            if(edit){
                query = "update book set book_name = "+bookName+", author_name="+authorName+", "
                        + "release_date= "+releaseDate+", description = "+description+" where book_id = "+id;
                db.stmt.executeUpdate(query);
                db.stmt2.executeUpdate("delete from book_genre where book_id = "+id);
            }
            else{
                query= "insert into book(book_name, author_name, release_date, description) values"
                    + "("+bookName + " , "+ authorName+ " , "+ releaseDate+ " , "+ description+" )";
                db.stmt.executeUpdate(query);
                db.rs = db.stmt.executeQuery("select book_id from book where book_name = "+bookName);
                db.rs.next();
                id = db.rs.getInt("book_id");
            }
            
            int count = edit_genre.size();
            for(int i=0; i<count;i++){
                String temp = (String)edit_genre.get(i);
                db.rs = db.stmt.executeQuery("select genre_id from genre where genre_name = '"+temp+"'");
                db.rs.next();
                int genreid = db.rs.getInt("genre_id");
                db.stmt.executeUpdate("insert into book_genre values("+id+","+genreid+")");
            }
            this.setVisible(false);this.dispose();
            if(edit) new ViewBooks().setVisible(true);
            else new BookManagement().setVisible(true);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }//GEN-LAST:event_jLabel21MouseClicked

    private void jTextField5MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTextField5MouseClicked
        this.setVisible(false); jDialog2.setVisible(true);
        if(edit){
            int index = 0;
            String elems[] = releaseDate2.split("-");
            Day.setSelectedItem(elems[0]);
            for(int i=0; i<Mon.getItemCount();i++){
                if(((String)Mon.getItemAt(i)).equalsIgnoreCase(elems[1])){
                    index = i;
                }
            }
            Mon.setSelectedIndex(index);
            Year.setText(elems[2]);
        }
    }//GEN-LAST:event_jTextField5MouseClicked

    private void jLabel29MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel29MouseClicked
        jList1.clearSelection();jList2.clearSelection();
        int count = jList2.getLastVisibleIndex();
        if(!edit_genre.isEmpty()) edit_genre.removeAll(edit_genre);
        if(count != -1){
            genre = "" + jList2.getModel().getElementAt(0);
            edit_genre.add(jList2.getModel().getElementAt(0));
            for(int i=1; i<=count; i++){
                genre =genre + ", " + jList2.getModel().getElementAt(i);
                edit_genre.add(jList2.getModel().getElementAt(i));
            }
            jTextField6.setText(genre);
            this.setVisible(true); jDialog1.setVisible(false);
        }
        else {
            JOptionPane.showMessageDialog(this, "Select at least one genre.");
        }
    }//GEN-LAST:event_jLabel29MouseClicked

    private void jTextField6MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTextField6MouseClicked
        try {
            jDialog1.setVisible(true); this.setVisible(false);
            db.rs = db.stmt.executeQuery("select * from genre");
            DefaultListModel dlm = new DefaultListModel();
            while(db.rs.next()){
                dlm.addElement(db.rs.getString("genre_name"));
            }
            jList1.setModel(dlm);
            dlm = new DefaultListModel();
            if(edit){
                for(int i=0; i<edit_genre.size(); i++){
                    dlm.addElement(edit_genre.get(i));
                }
            }
            jList2.setModel(dlm);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }//GEN-LAST:event_jTextField6MouseClicked

    private void jTextField5KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTextField5KeyPressed
        this.setVisible(false); jDialog2.setVisible(true);
        if(edit){
            int index = 0;
            String elems[] = releaseDate2.split("-");
            Day.setSelectedItem(elems[0]);
            for(int i=0; i<Mon.getItemCount();i++){
                if(((String)Mon.getItemAt(i)).equalsIgnoreCase(elems[1])){
                    index = i;
                }
            }
            Mon.setSelectedIndex(index);
            Year.setText(elems[2]);
        }
    }//GEN-LAST:event_jTextField5KeyPressed

    private void jLabel34MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel34MouseClicked
        List l = jList1.getSelectedValuesList();
        int count = jList2.getLastVisibleIndex();
        DefaultListModel dlm = new DefaultListModel();
        for(int i=0; i<=count; i++){
            dlm.addElement(jList2.getModel().getElementAt(i)); 
            if(l.contains(jList2.getModel().getElementAt(i))){
                System.out.println(jList2.getModel().getElementAt(i));
                l.remove(jList2.getModel().getElementAt(i));
            }System.out.println("size = "+ l.size());
        }
        for(int i=0; i<l.size(); i++){
            dlm.addElement(l.get(i));
        }
        jList2.setModel(dlm);
    }//GEN-LAST:event_jLabel34MouseClicked

    private void jLabel35MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel35MouseClicked
        List l = jList2.getSelectedValuesList();
        int count = jList2.getLastVisibleIndex();
        DefaultListModel dlm = new DefaultListModel();
        for(int i=0; i<=count; i++){
            if(!l.contains(jList2.getModel().getElementAt(i))){
                dlm.addElement(jList2.getModel().getElementAt(i));
            }
        }
        jList2.setModel(dlm);
    }//GEN-LAST:event_jLabel35MouseClicked

    private void jDialog1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jDialog1MouseClicked
        jList1.clearSelection();jList2.clearSelection();
    }//GEN-LAST:event_jDialog1MouseClicked

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        String Month = (String)Mon.getSelectedItem();
        String day = (String)Day.getSelectedItem();
        int year=0;
        if(days_30.contains(Month)){
            if(day.equals("31")){
                JOptionPane.showMessageDialog(null, "The selected month does not have 31 days!");
                return;
            }
        }
        try{
            year = Integer.parseInt(Year.getText());
        }
        catch(NumberFormatException ex){
            JOptionPane.showMessageDialog(null, "Invalid Year");
            ex.printStackTrace(); return;}
        if(year < 0){JOptionPane.showMessageDialog(null, "Invalid Year");}
        releaseDate2 = day+"-"+Month+"-"+year;
        jTextField5.setText(releaseDate2);
        //releaseDate = "'"+releaseDate+"'";
        jDialog2.setVisible(false); this.setVisible(true);
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jTextField6KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTextField6KeyPressed
        try {
            jDialog1.setVisible(true); this.setVisible(false);
            db.rs = db.stmt.executeQuery("select * from genre");
            DefaultListModel dlm = new DefaultListModel();
            while(db.rs.next()){
                dlm.addElement(db.rs.getString("genre_name"));
            }
            jList1.setModel(dlm);
            dlm = new DefaultListModel();
            if(edit){
                for(int i=0; i<edit_genre.size(); i++){
                    dlm.addElement(edit_genre.get(i));
                }
            }
            jList2.setModel(dlm);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }//GEN-LAST:event_jTextField6KeyPressed

    private void jLabel20MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel20MouseClicked
        this.setVisible(false);this.dispose();
        if(edit) new ViewBooks().setVisible(true);
        else new BookManagement().setVisible(true);
    }//GEN-LAST:event_jLabel20MouseClicked

    private void jLabel22MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel22MouseClicked
        try {
            if(bookNameField.getText().equals("")||authorNameField.getText().equals("")||
                    jTextField5.getText().equals("")||jTextField6.getText().equals("")||descriptionField.getText().equals("")){
                JOptionPane.showMessageDialog(null, "Input can't be empty"); return;
            }
            bookName = "'"+bookNameField.getText()+"'";
            authorName = "'"+authorNameField.getText()+"'";
            description = "'"+descriptionField.getText()+"'";
            releaseDate = "'"+releaseDate2+"'";
            String query;
            if(edit){
                query = "update book set book_name = "+bookName+", author_name="+authorName+", "
                        + "release_date= "+releaseDate+", description = "+description+" where book_id = "+id;
                db.stmt.executeUpdate(query);
                db.stmt2.executeUpdate("delete from book_genre where book_id = "+id);
            }
            else{
                query= "insert into book(book_name, author_name, release_date, description) values"
                    + "("+bookName + " , "+ authorName+ " , "+ releaseDate+ " , "+ description+" )";
                db.stmt.executeUpdate(query);
                db.rs = db.stmt.executeQuery("select book_id from book where book_name = "+bookName);
                db.rs.next();
                id = db.rs.getInt("book_id");
            }
            
            int count = edit_genre.size();
            for(int i=0; i<count;i++){
                String temp = (String)edit_genre.get(i);
                db.rs = db.stmt.executeQuery("select genre_id from genre where genre_name = '"+temp+"'");
                db.rs.next();
                int genreid = db.rs.getInt("genre_id");
                db.stmt.executeUpdate("insert into book_genre values("+id+","+genreid+")");
            }
            this.setVisible(false);this.dispose();
            if(edit) new ViewBooks().setVisible(true);
            else new BookManagement().setVisible(true);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }//GEN-LAST:event_jLabel22MouseClicked

    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(AddNewBook.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(AddNewBook.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(AddNewBook.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(AddNewBook.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new AddNewBook(id).setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JComboBox Day;
    private javax.swing.JComboBox Mon;
    private javax.swing.JTextField Year;
    private javax.swing.JTextField authorNameField;
    private javax.swing.JTextField bookNameField;
    private javax.swing.JEditorPane descriptionField;
    private javax.swing.JButton jButton1;
    private javax.swing.JDialog jDialog1;
    private javax.swing.JDialog jDialog2;
    private javax.swing.JLabel jLabel19;
    private javax.swing.JLabel jLabel20;
    private javax.swing.JLabel jLabel21;
    private javax.swing.JLabel jLabel22;
    private javax.swing.JLabel jLabel23;
    private javax.swing.JLabel jLabel24;
    private javax.swing.JLabel jLabel25;
    private javax.swing.JLabel jLabel26;
    private javax.swing.JLabel jLabel27;
    private javax.swing.JLabel jLabel28;
    private javax.swing.JLabel jLabel29;
    private javax.swing.JLabel jLabel30;
    private javax.swing.JLabel jLabel31;
    private javax.swing.JLabel jLabel32;
    private javax.swing.JLabel jLabel33;
    private javax.swing.JLabel jLabel34;
    private javax.swing.JLabel jLabel35;
    private javax.swing.JLabel jLabel36;
    private javax.swing.JList jList1;
    private javax.swing.JList jList2;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JScrollPane jScrollPane4;
    private javax.swing.JTextField jTextField5;
    private javax.swing.JTextField jTextField6;
    // End of variables declaration//GEN-END:variables
}
