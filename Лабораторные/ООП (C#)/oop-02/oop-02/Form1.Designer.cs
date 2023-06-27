namespace oop_02
{
    partial class Form1
    {
        /// <summary>
        /// Обязательная переменная конструктора.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Освободить все используемые ресурсы.
        /// </summary>
        /// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Код, автоматически созданный конструктором форм Windows

        /// <summary>
        /// Требуемый метод для поддержки конструктора — не изменяйте 
        /// содержимое этого метода с помощью редактора кода.
        /// </summary>
        private void InitializeComponent()
        {
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.saveButton = new System.Windows.Forms.Button();
            this.producerLabel = new System.Windows.Forms.Label();
            this.producerInput = new System.Windows.Forms.CheckedListBox();
            this.priceInput = new System.Windows.Forms.TextBox();
            this.priceLabel = new System.Windows.Forms.Label();
            this.quantityInput = new System.Windows.Forms.NumericUpDown();
            this.quantityLabel = new System.Windows.Forms.Label();
            this.dateInput = new System.Windows.Forms.MonthCalendar();
            this.dateLabel = new System.Windows.Forms.Label();
            this.typeInput3 = new System.Windows.Forms.CheckBox();
            this.typeInput2 = new System.Windows.Forms.CheckBox();
            this.typeInput1 = new System.Windows.Forms.CheckBox();
            this.typeLabel = new System.Windows.Forms.Label();
            this.weightInput = new System.Windows.Forms.ComboBox();
            this.weightLabel = new System.Windows.Forms.Label();
            this.sizeInput3 = new System.Windows.Forms.RadioButton();
            this.sizeInput2 = new System.Windows.Forms.RadioButton();
            this.sizeInput1 = new System.Windows.Forms.RadioButton();
            this.invNumInput = new System.Windows.Forms.MaskedTextBox();
            this.titleInput = new System.Windows.Forms.RichTextBox();
            this.sizeLabel = new System.Windows.Forms.Label();
            this.invNumLabel = new System.Windows.Forms.Label();
            this.titleLabel = new System.Windows.Forms.Label();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.button1 = new System.Windows.Forms.Button();
            this.richTextBox1 = new System.Windows.Forms.RichTextBox();
            this.tabPage3 = new System.Windows.Forms.TabPage();
            this.addProducerButton = new System.Windows.Forms.Button();
            this.countryInputEa = new System.Windows.Forms.RadioButton();
            this.countryInputEu = new System.Windows.Forms.RadioButton();
            this.countryInputOc = new System.Windows.Forms.RadioButton();
            this.telNumInput = new System.Windows.Forms.MaskedTextBox();
            this.telNumLabel = new System.Windows.Forms.Label();
            this.addressInput = new System.Windows.Forms.TextBox();
            this.addressLabel = new System.Windows.Forms.Label();
            this.countryLabel = new System.Windows.Forms.Label();
            this.organisationInput = new System.Windows.Forms.TextBox();
            this.organisationLabel = new System.Windows.Forms.Label();
            this.tabControl1.SuspendLayout();
            this.tabPage1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.quantityInput)).BeginInit();
            this.tabPage2.SuspendLayout();
            this.tabPage3.SuspendLayout();
            this.SuspendLayout();
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabPage1);
            this.tabControl1.Controls.Add(this.tabPage2);
            this.tabControl1.Controls.Add(this.tabPage3);
            this.tabControl1.Font = new System.Drawing.Font("JetBrains Mono", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.tabControl1.Location = new System.Drawing.Point(0, -2);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(1069, 965);
            this.tabControl1.TabIndex = 0;
            this.tabControl1.SelectedIndexChanged += new System.EventHandler(this.tabControl1_SelectedIndexChanged);
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.saveButton);
            this.tabPage1.Controls.Add(this.producerLabel);
            this.tabPage1.Controls.Add(this.producerInput);
            this.tabPage1.Controls.Add(this.priceInput);
            this.tabPage1.Controls.Add(this.priceLabel);
            this.tabPage1.Controls.Add(this.quantityInput);
            this.tabPage1.Controls.Add(this.quantityLabel);
            this.tabPage1.Controls.Add(this.dateInput);
            this.tabPage1.Controls.Add(this.dateLabel);
            this.tabPage1.Controls.Add(this.typeInput3);
            this.tabPage1.Controls.Add(this.typeInput2);
            this.tabPage1.Controls.Add(this.typeInput1);
            this.tabPage1.Controls.Add(this.typeLabel);
            this.tabPage1.Controls.Add(this.weightInput);
            this.tabPage1.Controls.Add(this.weightLabel);
            this.tabPage1.Controls.Add(this.sizeInput3);
            this.tabPage1.Controls.Add(this.sizeInput2);
            this.tabPage1.Controls.Add(this.sizeInput1);
            this.tabPage1.Controls.Add(this.invNumInput);
            this.tabPage1.Controls.Add(this.titleInput);
            this.tabPage1.Controls.Add(this.sizeLabel);
            this.tabPage1.Controls.Add(this.invNumLabel);
            this.tabPage1.Controls.Add(this.titleLabel);
            this.tabPage1.Location = new System.Drawing.Point(4, 31);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(1061, 930);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "Ввод информации о товаре";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // saveButton
            // 
            this.saveButton.Cursor = System.Windows.Forms.Cursors.Hand;
            this.saveButton.Font = new System.Drawing.Font("JetBrains Mono", 16.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.saveButton.Location = new System.Drawing.Point(274, 842);
            this.saveButton.Name = "saveButton";
            this.saveButton.Size = new System.Drawing.Size(230, 74);
            this.saveButton.TabIndex = 26;
            this.saveButton.Text = "Сохранить";
            this.saveButton.UseVisualStyleBackColor = true;
            this.saveButton.Click += new System.EventHandler(this.saveButton_Click);
            // 
            // producerLabel
            // 
            this.producerLabel.AutoSize = true;
            this.producerLabel.Font = new System.Drawing.Font("JetBrains Mono", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.producerLabel.Location = new System.Drawing.Point(396, 726);
            this.producerLabel.Name = "producerLabel";
            this.producerLabel.Size = new System.Drawing.Size(168, 26);
            this.producerLabel.TabIndex = 24;
            this.producerLabel.Text = "Производитель";
            // 
            // producerInput
            // 
            this.producerInput.Font = new System.Drawing.Font("JetBrains Mono", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.producerInput.FormattingEnabled = true;
            this.producerInput.Items.AddRange(new object[] {
            "Nokia",
            "Samsung",
            "Apple"});
            this.producerInput.Location = new System.Drawing.Point(7, 644);
            this.producerInput.Name = "producerInput";
            this.producerInput.Size = new System.Drawing.Size(376, 178);
            this.producerInput.TabIndex = 23;
            this.producerInput.Click += new System.EventHandler(this.producerInput_Click);
            this.producerInput.SelectedIndexChanged += new System.EventHandler(this.producerInput_SelectedIndexChanged);
            this.producerInput.Enter += new System.EventHandler(this.producerInput_Enter);
            this.producerInput.Layout += new System.Windows.Forms.LayoutEventHandler(this.producerInput_Layout);
            this.producerInput.Leave += new System.EventHandler(this.producerInput_Leave);
            // 
            // priceInput
            // 
            this.priceInput.Font = new System.Drawing.Font("JetBrains Mono", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.priceInput.Location = new System.Drawing.Point(6, 603);
            this.priceInput.Name = "priceInput";
            this.priceInput.Size = new System.Drawing.Size(195, 34);
            this.priceInput.TabIndex = 22;
            this.priceInput.TextChanged += new System.EventHandler(this.priceInput_TextChanged);
            // 
            // priceLabel
            // 
            this.priceLabel.AutoSize = true;
            this.priceLabel.Font = new System.Drawing.Font("JetBrains Mono", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.priceLabel.Location = new System.Drawing.Point(396, 607);
            this.priceLabel.Name = "priceLabel";
            this.priceLabel.Size = new System.Drawing.Size(60, 26);
            this.priceLabel.TabIndex = 21;
            this.priceLabel.Text = "Цена";
            // 
            // quantityInput
            // 
            this.quantityInput.Font = new System.Drawing.Font("JetBrains Mono", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.quantityInput.Location = new System.Drawing.Point(6, 563);
            this.quantityInput.Maximum = new decimal(new int[] {
            100000,
            0,
            0,
            0});
            this.quantityInput.Name = "quantityInput";
            this.quantityInput.Size = new System.Drawing.Size(195, 34);
            this.quantityInput.TabIndex = 20;
            this.quantityInput.ValueChanged += new System.EventHandler(this.quantityInput_ValueChanged);
            this.quantityInput.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.quantityInput_KeyPress);
            // 
            // quantityLabel
            // 
            this.quantityLabel.AutoSize = true;
            this.quantityLabel.Font = new System.Drawing.Font("JetBrains Mono", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.quantityLabel.Location = new System.Drawing.Point(396, 565);
            this.quantityLabel.Name = "quantityLabel";
            this.quantityLabel.Size = new System.Drawing.Size(132, 26);
            this.quantityLabel.TabIndex = 19;
            this.quantityLabel.Text = "Количество";
            // 
            // dateInput
            // 
            this.dateInput.CalendarDimensions = new System.Drawing.Size(2, 1);
            this.dateInput.Location = new System.Drawing.Point(6, 350);
            this.dateInput.Name = "dateInput";
            this.dateInput.TabIndex = 18;
            // 
            // dateLabel
            // 
            this.dateLabel.AutoSize = true;
            this.dateLabel.Font = new System.Drawing.Font("JetBrains Mono", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.dateLabel.Location = new System.Drawing.Point(396, 432);
            this.dateLabel.Name = "dateLabel";
            this.dateLabel.Size = new System.Drawing.Size(60, 26);
            this.dateLabel.TabIndex = 17;
            this.dateLabel.Text = "Дата";
            // 
            // typeInput3
            // 
            this.typeInput3.AutoSize = true;
            this.typeInput3.Font = new System.Drawing.Font("JetBrains Mono", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.typeInput3.Location = new System.Drawing.Point(6, 313);
            this.typeInput3.Name = "typeInput3";
            this.typeInput3.Size = new System.Drawing.Size(370, 30);
            this.typeInput3.TabIndex = 16;
            this.typeInput3.Text = "Вообще маленбкий товар жесть";
            this.typeInput3.UseVisualStyleBackColor = true;
            this.typeInput3.CheckedChanged += new System.EventHandler(this.checkBox3_CheckedChanged);
            // 
            // typeInput2
            // 
            this.typeInput2.AutoSize = true;
            this.typeInput2.Font = new System.Drawing.Font("JetBrains Mono", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.typeInput2.Location = new System.Drawing.Point(6, 277);
            this.typeInput2.Name = "typeInput2";
            this.typeInput2.Size = new System.Drawing.Size(202, 30);
            this.typeInput2.TabIndex = 15;
            this.typeInput2.Text = "Товар поменбше";
            this.typeInput2.UseVisualStyleBackColor = true;
            this.typeInput2.CheckedChanged += new System.EventHandler(this.checkBox2_CheckedChanged);
            // 
            // typeInput1
            // 
            this.typeInput1.AutoSize = true;
            this.typeInput1.Font = new System.Drawing.Font("JetBrains Mono", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.typeInput1.Location = new System.Drawing.Point(6, 241);
            this.typeInput1.Name = "typeInput1";
            this.typeInput1.Size = new System.Drawing.Size(214, 30);
            this.typeInput1.TabIndex = 14;
            this.typeInput1.Text = "Маленбкий товар";
            this.typeInput1.UseVisualStyleBackColor = true;
            this.typeInput1.CheckedChanged += new System.EventHandler(this.checkBox1_CheckedChanged);
            // 
            // typeLabel
            // 
            this.typeLabel.AutoSize = true;
            this.typeLabel.Font = new System.Drawing.Font("JetBrains Mono", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.typeLabel.Location = new System.Drawing.Point(396, 281);
            this.typeLabel.Name = "typeLabel";
            this.typeLabel.Size = new System.Drawing.Size(48, 26);
            this.typeLabel.TabIndex = 13;
            this.typeLabel.Text = "Тип";
            this.typeLabel.Click += new System.EventHandler(this.label5_Click);
            // 
            // weightInput
            // 
            this.weightInput.FormattingEnabled = true;
            this.weightInput.Items.AddRange(new object[] {
            "1",
            "2",
            "5",
            "10"});
            this.weightInput.Location = new System.Drawing.Point(6, 210);
            this.weightInput.Name = "weightInput";
            this.weightInput.Size = new System.Drawing.Size(198, 30);
            this.weightInput.TabIndex = 12;
            this.weightInput.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
            this.weightInput.TextChanged += new System.EventHandler(this.weightInput_TextChanged);
            this.weightInput.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.weightInput_KeyPress);
            // 
            // weightLabel
            // 
            this.weightLabel.AutoSize = true;
            this.weightLabel.Font = new System.Drawing.Font("JetBrains Mono", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.weightLabel.Location = new System.Drawing.Point(396, 210);
            this.weightLabel.Name = "weightLabel";
            this.weightLabel.Size = new System.Drawing.Size(48, 26);
            this.weightLabel.TabIndex = 11;
            this.weightLabel.Text = "Вес";
            this.weightLabel.Click += new System.EventHandler(this.label4_Click);
            // 
            // sizeInput3
            // 
            this.sizeInput3.AutoSize = true;
            this.sizeInput3.Font = new System.Drawing.Font("JetBrains Mono", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.sizeInput3.Location = new System.Drawing.Point(6, 174);
            this.sizeInput3.Name = "sizeInput3";
            this.sizeInput3.Size = new System.Drawing.Size(105, 30);
            this.sizeInput3.TabIndex = 10;
            this.sizeInput3.TabStop = true;
            this.sizeInput3.Text = "0.1 м3";
            this.sizeInput3.UseVisualStyleBackColor = true;
            this.sizeInput3.CheckedChanged += new System.EventHandler(this.radioButton3_CheckedChanged);
            // 
            // sizeInput2
            // 
            this.sizeInput2.AutoSize = true;
            this.sizeInput2.Font = new System.Drawing.Font("JetBrains Mono", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.sizeInput2.Location = new System.Drawing.Point(6, 138);
            this.sizeInput2.Name = "sizeInput2";
            this.sizeInput2.Size = new System.Drawing.Size(105, 30);
            this.sizeInput2.TabIndex = 9;
            this.sizeInput2.TabStop = true;
            this.sizeInput2.Text = "0.5 м3";
            this.sizeInput2.UseVisualStyleBackColor = true;
            this.sizeInput2.CheckedChanged += new System.EventHandler(this.radioButton2_CheckedChanged);
            // 
            // sizeInput1
            // 
            this.sizeInput1.AutoSize = true;
            this.sizeInput1.Font = new System.Drawing.Font("JetBrains Mono", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.sizeInput1.Location = new System.Drawing.Point(6, 102);
            this.sizeInput1.Name = "sizeInput1";
            this.sizeInput1.Size = new System.Drawing.Size(81, 30);
            this.sizeInput1.TabIndex = 8;
            this.sizeInput1.TabStop = true;
            this.sizeInput1.Text = "1 м3";
            this.sizeInput1.UseVisualStyleBackColor = true;
            this.sizeInput1.CheckedChanged += new System.EventHandler(this.radioButton1_CheckedChanged);
            // 
            // invNumInput
            // 
            this.invNumInput.Location = new System.Drawing.Point(7, 71);
            this.invNumInput.Mask = "00000";
            this.invNumInput.Name = "invNumInput";
            this.invNumInput.Size = new System.Drawing.Size(198, 30);
            this.invNumInput.TabIndex = 7;
            this.invNumInput.ValidatingType = typeof(int);
            this.invNumInput.MaskInputRejected += new System.Windows.Forms.MaskInputRejectedEventHandler(this.maskedTextBox1_MaskInputRejected);
            this.invNumInput.TextChanged += new System.EventHandler(this.invNumInput_TextChanged);
            this.invNumInput.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.invNumInput_KeyPress);
            // 
            // titleInput
            // 
            this.titleInput.Font = new System.Drawing.Font("JetBrains Mono", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.titleInput.Location = new System.Drawing.Point(6, 7);
            this.titleInput.Name = "titleInput";
            this.titleInput.Size = new System.Drawing.Size(200, 58);
            this.titleInput.TabIndex = 6;
            this.titleInput.Text = "";
            this.titleInput.TextChanged += new System.EventHandler(this.titleInput_TextChanged);
            // 
            // sizeLabel
            // 
            this.sizeLabel.AutoSize = true;
            this.sizeLabel.Font = new System.Drawing.Font("JetBrains Mono", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.sizeLabel.Location = new System.Drawing.Point(396, 142);
            this.sizeLabel.Name = "sizeLabel";
            this.sizeLabel.Size = new System.Drawing.Size(84, 26);
            this.sizeLabel.TabIndex = 5;
            this.sizeLabel.Text = "Размер";
            this.sizeLabel.Click += new System.EventHandler(this.label3_Click);
            // 
            // invNumLabel
            // 
            this.invNumLabel.AutoSize = true;
            this.invNumLabel.Font = new System.Drawing.Font("JetBrains Mono", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.invNumLabel.Location = new System.Drawing.Point(396, 67);
            this.invNumLabel.Name = "invNumLabel";
            this.invNumLabel.Size = new System.Drawing.Size(216, 26);
            this.invNumLabel.TabIndex = 3;
            this.invNumLabel.Text = "Инвентарный номер";
            this.invNumLabel.Click += new System.EventHandler(this.label2_Click);
            // 
            // titleLabel
            // 
            this.titleLabel.AutoSize = true;
            this.titleLabel.Font = new System.Drawing.Font("JetBrains Mono", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.titleLabel.Location = new System.Drawing.Point(396, 23);
            this.titleLabel.Name = "titleLabel";
            this.titleLabel.Size = new System.Drawing.Size(108, 26);
            this.titleLabel.TabIndex = 2;
            this.titleLabel.Text = "Название";
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.button1);
            this.tabPage2.Controls.Add(this.richTextBox1);
            this.tabPage2.Location = new System.Drawing.Point(4, 31);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(1061, 930);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "Вывод";
            this.tabPage2.UseVisualStyleBackColor = true;
            this.tabPage2.Click += new System.EventHandler(this.tabPage2_Click);
            // 
            // button1
            // 
            this.button1.Font = new System.Drawing.Font("JetBrains Mono", 16.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.button1.Location = new System.Drawing.Point(658, 10);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(371, 117);
            this.button1.TabIndex = 1;
            this.button1.Text = "Показать";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click_2);
            // 
            // richTextBox1
            // 
            this.richTextBox1.Location = new System.Drawing.Point(9, 7);
            this.richTextBox1.Name = "richTextBox1";
            this.richTextBox1.ReadOnly = true;
            this.richTextBox1.Size = new System.Drawing.Size(634, 578);
            this.richTextBox1.TabIndex = 0;
            this.richTextBox1.Text = "";
            // 
            // tabPage3
            // 
            this.tabPage3.Controls.Add(this.addProducerButton);
            this.tabPage3.Controls.Add(this.countryInputEa);
            this.tabPage3.Controls.Add(this.countryInputEu);
            this.tabPage3.Controls.Add(this.countryInputOc);
            this.tabPage3.Controls.Add(this.telNumInput);
            this.tabPage3.Controls.Add(this.telNumLabel);
            this.tabPage3.Controls.Add(this.addressInput);
            this.tabPage3.Controls.Add(this.addressLabel);
            this.tabPage3.Controls.Add(this.countryLabel);
            this.tabPage3.Controls.Add(this.organisationInput);
            this.tabPage3.Controls.Add(this.organisationLabel);
            this.tabPage3.Location = new System.Drawing.Point(4, 31);
            this.tabPage3.Name = "tabPage3";
            this.tabPage3.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage3.Size = new System.Drawing.Size(1061, 930);
            this.tabPage3.TabIndex = 2;
            this.tabPage3.Text = "Добавить производителя";
            this.tabPage3.UseVisualStyleBackColor = true;
            // 
            // addProducerButton
            // 
            this.addProducerButton.Font = new System.Drawing.Font("JetBrains Mono", 16.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.addProducerButton.Location = new System.Drawing.Point(532, 6);
            this.addProducerButton.Name = "addProducerButton";
            this.addProducerButton.Size = new System.Drawing.Size(512, 223);
            this.addProducerButton.TabIndex = 34;
            this.addProducerButton.Text = "Добавить";
            this.addProducerButton.UseVisualStyleBackColor = true;
            this.addProducerButton.Click += new System.EventHandler(this.button1_Click_1);
            this.addProducerButton.Leave += new System.EventHandler(this.addProducerButton_Leave);
            // 
            // countryInputEa
            // 
            this.countryInputEa.AutoSize = true;
            this.countryInputEa.Font = new System.Drawing.Font("JetBrains Mono", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.countryInputEa.Location = new System.Drawing.Point(9, 119);
            this.countryInputEa.Name = "countryInputEa";
            this.countryInputEa.Size = new System.Drawing.Size(129, 30);
            this.countryInputEa.TabIndex = 33;
            this.countryInputEa.TabStop = true;
            this.countryInputEa.Text = "Eastasia";
            this.countryInputEa.UseVisualStyleBackColor = true;
            // 
            // countryInputEu
            // 
            this.countryInputEu.AutoSize = true;
            this.countryInputEu.Font = new System.Drawing.Font("JetBrains Mono", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.countryInputEu.Location = new System.Drawing.Point(9, 83);
            this.countryInputEu.Name = "countryInputEu";
            this.countryInputEu.Size = new System.Drawing.Size(117, 30);
            this.countryInputEu.TabIndex = 32;
            this.countryInputEu.TabStop = true;
            this.countryInputEu.Text = "Eurasia";
            this.countryInputEu.UseVisualStyleBackColor = true;
            // 
            // countryInputOc
            // 
            this.countryInputOc.AutoSize = true;
            this.countryInputOc.Font = new System.Drawing.Font("JetBrains Mono", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.countryInputOc.Location = new System.Drawing.Point(9, 47);
            this.countryInputOc.Name = "countryInputOc";
            this.countryInputOc.Size = new System.Drawing.Size(117, 30);
            this.countryInputOc.TabIndex = 31;
            this.countryInputOc.TabStop = true;
            this.countryInputOc.Text = "Oceania";
            this.countryInputOc.UseVisualStyleBackColor = true;
            // 
            // telNumInput
            // 
            this.telNumInput.Font = new System.Drawing.Font("JetBrains Mono", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.telNumInput.Location = new System.Drawing.Point(8, 195);
            this.telNumInput.Mask = "000000000";
            this.telNumInput.Name = "telNumInput";
            this.telNumInput.Size = new System.Drawing.Size(253, 34);
            this.telNumInput.TabIndex = 30;
            // 
            // telNumLabel
            // 
            this.telNumLabel.AutoSize = true;
            this.telNumLabel.Font = new System.Drawing.Font("JetBrains Mono", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.telNumLabel.Location = new System.Drawing.Point(267, 198);
            this.telNumLabel.Name = "telNumLabel";
            this.telNumLabel.Size = new System.Drawing.Size(96, 26);
            this.telNumLabel.TabIndex = 29;
            this.telNumLabel.Text = "Телефон";
            // 
            // addressInput
            // 
            this.addressInput.Font = new System.Drawing.Font("JetBrains Mono", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.addressInput.Location = new System.Drawing.Point(8, 155);
            this.addressInput.Name = "addressInput";
            this.addressInput.Size = new System.Drawing.Size(253, 34);
            this.addressInput.TabIndex = 28;
            // 
            // addressLabel
            // 
            this.addressLabel.AutoSize = true;
            this.addressLabel.Font = new System.Drawing.Font("JetBrains Mono", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.addressLabel.Location = new System.Drawing.Point(267, 158);
            this.addressLabel.Name = "addressLabel";
            this.addressLabel.Size = new System.Drawing.Size(72, 26);
            this.addressLabel.TabIndex = 27;
            this.addressLabel.Text = "Адрес";
            // 
            // countryLabel
            // 
            this.countryLabel.AutoSize = true;
            this.countryLabel.Font = new System.Drawing.Font("JetBrains Mono", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.countryLabel.Location = new System.Drawing.Point(267, 87);
            this.countryLabel.Name = "countryLabel";
            this.countryLabel.Size = new System.Drawing.Size(84, 26);
            this.countryLabel.TabIndex = 25;
            this.countryLabel.Text = "Страна";
            // 
            // organisationInput
            // 
            this.organisationInput.Font = new System.Drawing.Font("JetBrains Mono", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.organisationInput.Location = new System.Drawing.Point(8, 6);
            this.organisationInput.Name = "organisationInput";
            this.organisationInput.Size = new System.Drawing.Size(253, 34);
            this.organisationInput.TabIndex = 24;
            // 
            // organisationLabel
            // 
            this.organisationLabel.AutoSize = true;
            this.organisationLabel.Font = new System.Drawing.Font("JetBrains Mono", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.organisationLabel.Location = new System.Drawing.Point(267, 9);
            this.organisationLabel.Name = "organisationLabel";
            this.organisationLabel.Size = new System.Drawing.Size(144, 26);
            this.organisationLabel.TabIndex = 23;
            this.organisationLabel.Text = "Организация";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSize = true;
            this.ClientSize = new System.Drawing.Size(1075, 957);
            this.Controls.Add(this.tabControl1);
            this.Name = "Form1";
            this.StartPosition = System.Windows.Forms.FormStartPosition.WindowsDefaultBounds;
            this.Text = "Form1";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.Form1_Load);
            this.tabControl1.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.tabPage1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.quantityInput)).EndInit();
            this.tabPage2.ResumeLayout(false);
            this.tabPage3.ResumeLayout(false);
            this.tabPage3.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.Label sizeLabel;
        private System.Windows.Forms.Label invNumLabel;
        private System.Windows.Forms.Label titleLabel;
        private System.Windows.Forms.CheckBox typeInput3;
        private System.Windows.Forms.CheckBox typeInput2;
        private System.Windows.Forms.CheckBox typeInput1;
        private System.Windows.Forms.Label typeLabel;
        private System.Windows.Forms.ComboBox weightInput;
        private System.Windows.Forms.Label weightLabel;
        private System.Windows.Forms.RadioButton sizeInput3;
        private System.Windows.Forms.RadioButton sizeInput2;
        private System.Windows.Forms.RadioButton sizeInput1;
        private System.Windows.Forms.MaskedTextBox invNumInput;
        private System.Windows.Forms.RichTextBox titleInput;
        private System.Windows.Forms.MonthCalendar dateInput;
        private System.Windows.Forms.Label dateLabel;
        private System.Windows.Forms.Label producerLabel;
        private System.Windows.Forms.CheckedListBox producerInput;
        private System.Windows.Forms.TextBox priceInput;
        private System.Windows.Forms.Label priceLabel;
        private System.Windows.Forms.NumericUpDown quantityInput;
        private System.Windows.Forms.Label quantityLabel;
        private System.Windows.Forms.TabPage tabPage3;
        private System.Windows.Forms.Button saveButton;
        private System.Windows.Forms.Label telNumLabel;
        private System.Windows.Forms.TextBox addressInput;
        private System.Windows.Forms.Label addressLabel;
        private System.Windows.Forms.Label countryLabel;
        private System.Windows.Forms.TextBox organisationInput;
        private System.Windows.Forms.Label organisationLabel;
        private System.Windows.Forms.RadioButton countryInputEa;
        private System.Windows.Forms.RadioButton countryInputEu;
        private System.Windows.Forms.RadioButton countryInputOc;
        private System.Windows.Forms.Button addProducerButton;
        private System.Windows.Forms.MaskedTextBox telNumInput;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.RichTextBox richTextBox1;
    }
}

