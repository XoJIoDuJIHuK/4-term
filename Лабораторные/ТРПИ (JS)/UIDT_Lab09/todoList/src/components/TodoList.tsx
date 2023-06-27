import React from 'react';
import PropTypes from 'prop-types';
import Todo from './Todo';
import { Todo as TodoType } from '../types/todoTypes';
import { Action } from '../types/actionTypes';

interface TodoListProps{
    todos:TodoType[],
    toggleTodoAC:(arg0: number) => void,
}

const TodoList = ({ todos, toggleTodoAC}:TodoListProps) => (
  <ul>
    {todos.map((todo) => (
      <Todo
            key={todo.id}
            {...todo}
            onClick={() => toggleTodoAC(todo.id)}
      />
    ))}
  </ul>
);

export default TodoList;
