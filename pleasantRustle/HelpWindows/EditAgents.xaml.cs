using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace pleasantRustle.HelpWindows
{
    /// <summary>
    /// Логика взаимодействия для EditAgents.xaml
    /// </summary>
    public partial class EditAgents : Window
    {
        private byte[] newByteImage;
        string pathImage;
        string PathImage
        {
            get
            {
                return pathImage;
            }
            set
            {
                pathImage = value;
            }
        }
        string sPathImage
        {
            get
            {
                return pathImage.Substring(1);
            }
        }
        public EditAgents(MainWindow mwSelested)
        {
            InitializeComponent();
            
            var allTypes = AgentsEntities.GetContext().AgentTypes.Select(n => n.TypeName).ToList();
            allTypes.Insert(0, "Все типы");
            cbTypeAgent.ItemsSource = allTypes;
            cbTypeAgent.SelectedIndex = 0;

     
                Agents selectedAgent = new Agents();
                Agents idSelect = new Agents();
                idSelect = mwSelested.listBox.SelectedItem as Agents;
                //selectedAgent = db.Agents.FirstOrDefault(a => a.Id == idSelect.Id);
                tbName.Text = idSelect.NameCompany;
                cbTypeAgent.SelectedIndex = (int)idSelect.AgentTypeId;
                tbPriority.Text = Convert.ToString( idSelect.Priority);
                tbAdress.Text = idSelect.Adress;
                tbINN.Text = idSelect.INN;
                tbKPP.Text = idSelect.KPP;
                tbDirector.Text = idSelect.Director;
                tbPhone.Text = idSelect.Phone;
                tbEmail.Text = idSelect.Email;
         




        }
        private void buttonAddPhoto_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog ofd = new OpenFileDialog();
            string[] extensions = { ".jpg", ".bmp", ".png", ".jpeg" };
            if (ofd.ShowDialog() == true)
            {

                if (extensions.Contains(System.IO.Path.GetExtension(ofd.FileName)))
                {
                    using (FileStream fs = new FileStream(ofd.FileName, FileMode.Open))
                    {
                        newByteImage = new byte[fs.Length];
                        fs.Read(newByteImage, 0, newByteImage.Length);
                    }

                    MemoryStream ms = new MemoryStream(newByteImage);

                    BitmapImage image = new BitmapImage();
                    image.BeginInit();
                    image.StreamSource = ms;
                    image.EndInit();

                    logoImageBox.Source = image;
                    logoTextBox.Content = "";

                    PathImage = $"\\agents\\{System.IO.Path.GetFileName(ofd.FileName)}";
                }
                else
                {
                    MessageBox.Show("Выбранный файл не является фотографией", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }

            }
        }
        public static string adressH { get; set; }
        private void tbAdress_PreviewMouseDown(object sender, MouseButtonEventArgs e)
        {
            HelpWindows.AdressHelper adressHelper = new HelpWindows.AdressHelper();
            adressHelper.Owner = this;
            adressHelper.ShowDialog();

            tbAdress.Text = adressH;
        }

        public static string fioDirector { get; set; }
        private void tbDirector_PreviewMouseDown(object sender, MouseButtonEventArgs e)
        {
            HelpWindows.DirectorHelper directirFIO = new HelpWindows.DirectorHelper();
            directirFIO.Owner = this;
            directirFIO.ShowDialog();
            tbDirector.Text = fioDirector;
        }

        private void tbPhone_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!(Char.IsDigit(e.Text, 0) || (e.Text == ".")
               && (!tbPhone.Text.Contains(".")
               && tbPhone.Text.Length != 0)))
            {
                e.Handled = true;
            }
            if (!(Char.IsDigit(e.Text, 0) || (e.Text == ".")
               && (!tbPhone.Text.Contains(".")
               && tbINN.Text.Length != 0)))
            {
                e.Handled = true;
            }
            if (!(Char.IsDigit(e.Text, 0) || (e.Text == ".")
               && (!tbKPP.Text.Contains(".")
               && tbPhone.Text.Length != 0)))
            {
                e.Handled = true;
            }
            if (!(Char.IsDigit(e.Text, 0) || (e.Text == ".")
               && (!tbPriority.Text.Contains(".")
               && tbPhone.Text.Length != 0)))
            {
                e.Handled = true;
            }
            if (!(Char.IsLetterOrDigit(e.Text, 0) || (e.Text == ".")
                    && (!tbName.Text.Contains(".")
                    && tbName.Text.Length != 0)))
            {
                e.Handled = true;
            }
        }
    }
}
