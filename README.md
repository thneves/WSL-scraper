# WSL scraper

> This project is a web scraper of the World Surf League website to get text info about events and surfers, and display it on terminal.

- The program has 2 options of Scraping: Events and Surfers.
- In both options you can filter your scraping by country.

- For events you can check all WSL events around the year in the choosen country.
- - It will be specified by date, event name, location and tour type.

![Display Events](./events.png)

- For surfers you can check the top 35 surfers in the Championship Tour.
- - It will display the actual surfer rank, name and url link for more information.

![Display Surfers](./surfshot.png)

## Built With

- Ruby
- Rspec

Gems:

- Nokogiri
- Open Uri

## Live Demo

[Live Demo Link](https://repl.it/@ThalesNeves/WSL-scraper#bin/main.rb)
- type 'cd bin/' in  the repl.it terminal/shell, then type'ruby main.rb' to run the program


### Prerequisites

- Ruby 
- - [Install Ruby Here](https://www.ruby-lang.org/en/downloads/)
- Linux (if you don't use linux use the live demo above)
- Rspec
- - **Type: *'gem install rspec'* in your terminal**

### Get started
- Create a folder to download the program
- - Option 1: You can click in the green button **Code** above use the **Download ZIP** option to download the files
- - Option 2: Clone this repository to your computer. Open the terminal in the folder you create and paste this **git clone git@github.com:thneves/WSL-scraper.git**, now you have files you need.

- Open the terminal in the respective folder.
- Type **gem install bundler** in the terminal and wait installation.
- Type **'bundle install'** to install the packages to the program work.
- Type **'cd /bin'** in the terminal to navigate to the file where you execute the program.
- Type **ruby main.rb** to run the program
- Follow the program instructions
- Have Fun :surfer:

### Testing

- To run the tests in the program type **rspec** in the terminal inside the program folder

## Author

👤 **Thales Neves**

- GitHub: [@thneves](https://github.com/thneves)
- LinkedIn: [@thales-neves10](https://www.linkedin.com/in/thales-neves10/)
- Twitter: [@tsneves11](https://twitter.com/tsneves11)


## Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/thneves/WSL-scraper/issues).

## Support this project

Give a :star: if you like this project!

## Acknowledgements

[WSL](https://www.worldsurfleague.com/) World Surf League