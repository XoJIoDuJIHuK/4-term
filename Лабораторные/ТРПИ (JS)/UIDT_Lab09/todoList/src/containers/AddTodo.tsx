import React, {Component, createContext, FC, ReactNode, useContext} from "react";
import { connect } from "react-redux";
import { addTodoAC } from "../actions";
import {Dispatch} from "../types/actionTypes";

interface AddTodoProps {
    dispatch: Dispatch;
}

const AddTodo: React.FC<AddTodoProps> = ({ dispatch }) => {
  let input:HTMLInputElement;

  return (
    <div>
      <form
        onSubmit={(e:React.FormEvent) => {
          e.preventDefault();
          if (!input.value.trim()) {
            return;
          }
          dispatch(addTodoAC(input.value));
          input.value = "";
        }}
      >
        <input ref={(node:HTMLElement) => (input = node)} />
        <button type="submit">Add Todo</button>
      </form>
    </div>
  );
};

export default connect()(AddTodo);
