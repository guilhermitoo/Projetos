import React, {Component} from "react";

class Header extends Component {
    render() {
    return (
        <header class="py-4 grid grid-cols-6 border-b-2 border-gray-600">
            <h1 class="text-center col-start-2 col-end-6 font-bold md:text-2xl text-gray-600">{this.props.name}</h1>      
        </header>
    );
    }}

export default Header;