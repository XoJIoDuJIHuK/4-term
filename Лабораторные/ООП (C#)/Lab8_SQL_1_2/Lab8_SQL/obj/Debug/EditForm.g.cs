﻿#pragma checksum "..\..\EditForm.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "AEB6D32009ADAB9493306506CC971DD023428F553113B63BAD47E30E998AA234"
//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.42000
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

using Lab8_SQL;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace Lab8_SQL {
    
    
    /// <summary>
    /// EditForm
    /// </summary>
    public partial class EditForm : System.Windows.Window, System.Windows.Markup.IComponentConnector {
        
        
        #line 13 "..\..\EditForm.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox id;
        
        #line default
        #line hidden
        
        
        #line 16 "..\..\EditForm.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox first_name;
        
        #line default
        #line hidden
        
        
        #line 19 "..\..\EditForm.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox last_name;
        
        #line default
        #line hidden
        
        
        #line 22 "..\..\EditForm.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox date_of_birth;
        
        #line default
        #line hidden
        
        
        #line 25 "..\..\EditForm.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox email;
        
        #line default
        #line hidden
        
        
        #line 28 "..\..\EditForm.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox phone;
        
        #line default
        #line hidden
        
        
        #line 31 "..\..\EditForm.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox address;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/Lab8_SQL;component/editform.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\EditForm.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.id = ((System.Windows.Controls.TextBox)(target));
            
            #line 13 "..\..\EditForm.xaml"
            this.id.TextChanged += new System.Windows.Controls.TextChangedEventHandler(this.id_TextChanged);
            
            #line default
            #line hidden
            return;
            case 2:
            this.first_name = ((System.Windows.Controls.TextBox)(target));
            
            #line 16 "..\..\EditForm.xaml"
            this.first_name.TextChanged += new System.Windows.Controls.TextChangedEventHandler(this.first_name_TextChanged);
            
            #line default
            #line hidden
            return;
            case 3:
            this.last_name = ((System.Windows.Controls.TextBox)(target));
            
            #line 19 "..\..\EditForm.xaml"
            this.last_name.TextChanged += new System.Windows.Controls.TextChangedEventHandler(this.last_name_TextChanged);
            
            #line default
            #line hidden
            return;
            case 4:
            this.date_of_birth = ((System.Windows.Controls.TextBox)(target));
            
            #line 22 "..\..\EditForm.xaml"
            this.date_of_birth.TextChanged += new System.Windows.Controls.TextChangedEventHandler(this.date_of_birth_TextChanged);
            
            #line default
            #line hidden
            return;
            case 5:
            this.email = ((System.Windows.Controls.TextBox)(target));
            
            #line 25 "..\..\EditForm.xaml"
            this.email.TextChanged += new System.Windows.Controls.TextChangedEventHandler(this.email_TextChanged);
            
            #line default
            #line hidden
            return;
            case 6:
            this.phone = ((System.Windows.Controls.TextBox)(target));
            
            #line 28 "..\..\EditForm.xaml"
            this.phone.TextChanged += new System.Windows.Controls.TextChangedEventHandler(this.phone_TextChanged);
            
            #line default
            #line hidden
            return;
            case 7:
            this.address = ((System.Windows.Controls.TextBox)(target));
            return;
            case 8:
            
            #line 33 "..\..\EditForm.xaml"
            ((System.Windows.Controls.Button)(target)).Click += new System.Windows.RoutedEventHandler(this.Button_Click);
            
            #line default
            #line hidden
            return;
            case 9:
            
            #line 34 "..\..\EditForm.xaml"
            ((System.Windows.Controls.Button)(target)).Click += new System.Windows.RoutedEventHandler(this.Button_Click_1);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

