using System;
using System.Windows.Input;

namespace oop_04
{
    public class FuncCommand : ICommand
    {
        private Func<object, object> pFunc;

        public FuncCommand(Func<object, object> func) { pFunc = func; }

        public event EventHandler? CanExecuteChanged = (sender, e) => { };

        public bool CanExecute(object? parameter)
        {
            return true;
        }

        public void Execute(object? parameter)
        {
            pFunc(parameter);
        }
    }
}