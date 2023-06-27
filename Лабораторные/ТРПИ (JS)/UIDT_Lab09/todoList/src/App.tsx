import React from 'react';
import Footer from './components/Footer';
import AddTodo from './containers/AddTodo';
import VisibleTodoList from './containers/VisibleTodoList';

function App() {

  return (
    <div className="App">
        <AddTodo/>
        <VisibleTodoList/>
        <Footer/>
    </div>
  )
}

export default App
