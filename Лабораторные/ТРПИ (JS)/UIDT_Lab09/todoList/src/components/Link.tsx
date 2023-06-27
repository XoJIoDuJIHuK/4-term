import React, {ReactNode} from 'react';
import PropTypes from 'prop-types';

interface LinkProps{
    active:boolean;
    children:ReactNode;
    onClick:() => void;
}

const Link = ({ active, children, onClick }:LinkProps)  => (
  <button
    onClick={onClick}
    disabled={active}
    style={{
      marginLeft: '4px',
    }}
  >
    {children}
  </button>
);


export default Link;
