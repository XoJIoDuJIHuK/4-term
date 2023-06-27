using System;
using System.Windows.Input;

namespace oop_04
{
    public class RelayCommand : ICommand
    {
        private Action pAction;

        public RelayCommand(Action action) { pAction = action; }

        public event EventHandler? CanExecuteChanged = (sender, e) => { };
        public bool canExecute = true;

        public bool CanExecute(object? parameter)
        {
            return canExecute;
        }

        public void Execute(object? parameter)
        {
            pAction();
        }
    }
}