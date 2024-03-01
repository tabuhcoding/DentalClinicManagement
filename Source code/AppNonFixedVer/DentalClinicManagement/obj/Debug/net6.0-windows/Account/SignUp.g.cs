﻿#pragma checksum "..\..\..\..\Account\SignUp.xaml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "654288B9E03D4BA339126BF69ED4917CF1713FDA"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using DentalClinicManagement.Account;
using DentalClinicManagement.Converter;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Controls.Ribbon;
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


namespace DentalClinicManagement.Account {
    
    
    /// <summary>
    /// SignUp
    /// </summary>
    public partial class SignUp : System.Windows.Controls.Page, System.Windows.Markup.IComponentConnector {
        
        
        #line 30 "..\..\..\..\Account\SignUp.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox FullNameTextBox;
        
        #line default
        #line hidden
        
        
        #line 37 "..\..\..\..\Account\SignUp.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button CompleteSignUpButton;
        
        #line default
        #line hidden
        
        
        #line 45 "..\..\..\..\Account\SignUp.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox BirthDateTextBox;
        
        #line default
        #line hidden
        
        
        #line 52 "..\..\..\..\Account\SignUp.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox EmailTextBox;
        
        #line default
        #line hidden
        
        
        #line 59 "..\..\..\..\Account\SignUp.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox PhoneNumberTextBox;
        
        #line default
        #line hidden
        
        
        #line 66 "..\..\..\..\Account\SignUp.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox AddressTextBox;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "8.0.1.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/DentalClinicManagement;component/account/signup.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\..\Account\SignUp.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "8.0.1.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            
            #line 10 "..\..\..\..\Account\SignUp.xaml"
            ((DentalClinicManagement.Account.SignUp)(target)).Loaded += new System.Windows.RoutedEventHandler(this.WindowLoaded);
            
            #line default
            #line hidden
            return;
            case 2:
            
            #line 17 "..\..\..\..\Account\SignUp.xaml"
            ((System.Windows.Controls.Button)(target)).Click += new System.Windows.RoutedEventHandler(this.OnBackButtonClick);
            
            #line default
            #line hidden
            return;
            case 3:
            this.FullNameTextBox = ((System.Windows.Controls.TextBox)(target));
            return;
            case 4:
            this.CompleteSignUpButton = ((System.Windows.Controls.Button)(target));
            
            #line 37 "..\..\..\..\Account\SignUp.xaml"
            this.CompleteSignUpButton.Click += new System.Windows.RoutedEventHandler(this.CompleteSignUpButton_Click);
            
            #line default
            #line hidden
            return;
            case 5:
            this.BirthDateTextBox = ((System.Windows.Controls.TextBox)(target));
            return;
            case 6:
            this.EmailTextBox = ((System.Windows.Controls.TextBox)(target));
            return;
            case 7:
            this.PhoneNumberTextBox = ((System.Windows.Controls.TextBox)(target));
            return;
            case 8:
            this.AddressTextBox = ((System.Windows.Controls.TextBox)(target));
            return;
            }
            this._contentLoaded = true;
        }
    }
}

