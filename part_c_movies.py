import psycopg2
from psycopg2 import sql

DB_NAME = "movies_db"
DB_USER = "postgres"
DB_PASSWORD = "1234"
DB_HOST = "localhost"
DB_PORT = "5432"


# Function to connect database
def connect_to_db(dbname=DB_NAME):
    try:
        conn = psycopg2.connect(
            dbname=dbname,
            user=DB_USER,
            password=DB_PASSWORD,
            host=DB_HOST,
            port=DB_PORT
        )
        return conn
    except Exception as e:
        print(f"Error connecting to the database: {e}")
        return None


# Function to read data from the movies table
def read_movies():
    conn = connect_to_db()
    if conn is None:
        print("Failed to connect to the database. Exiting read_movies.")
        return

    cursor = conn.cursor()
    try:
        cursor.execute("SELECT * FROM movies")
        rows = cursor.fetchall()
        for row in rows:
            print(row)
    except Exception as e:
        print(f"Error reading movies: {e}")
    finally:
        cursor.close()
        conn.close()


# Function to search for a movie
def serch_movie():
    conn = connect_to_db()
    if conn is None:
        print("Failed to connect to the database.")
        return

    cursor = conn.cursor()
    string_movie = input("Enter your string to search: ")
    try:
        cursor.execute("""
            SELECT * FROM movies
            WHERE movie_name ILIKE %s
        """, (f"%{string_movie}%",))

        movies = cursor.fetchall()
        if movies:
            print(f"The movies found: {movies}")
            return True
        else:
            print("No movies found.")
    except Exception as e:
        print(f"Error during search: {e}")
    finally:
        cursor.close()
        conn.close()


# Function to insert a movie into the movies table
def insert_movie():
    conn = connect_to_db()
    if conn is None:
        print("Failed to connect to the database.")
        return

    cursor = conn.cursor()
    try:
        movie_name = input("Enter movie name: ")
        genre = input("Enter genre: ")
        country = input("Enter country: ")
        language = input("Enter language: ")

        #  Validate the year
        while True:
            try:
                year = int(input("Enter year (>= 2009): "))
                if year >= 2009:
                    break
                else:
                    print(" Error: Year must be 2009 or later.")
            except ValueError:
                print(" Invalid input. Please enter a valid integer.")

        # Validate the revenue
        while True:
            try:
                revenue = float(input("Enter revenue (must be >= 0): "))
                if revenue >= 0:
                    break
                else:
                    print("Error: Revenue cannot be negative.")
            except ValueError:
                print("Invalid input. Please enter a valid number.")

        # Movie data to insert
        movie = (movie_name, genre, country, language, year, revenue)

        cursor.execute("""
            INSERT INTO movies (movie_name, genre, country, language, year, revenue)
            VALUES (%s, %s, %s, %s, %s, %s)
        """, movie)
        conn.commit()
        print(" Movie inserted successfully.")
    except ValueError:
        print(" Invalid input. Year must be an integer, and revenue must be a number.")
    except Exception as e:
        print(f" Error inserting movie: {e}")
    finally:
        cursor.close()
        conn.close()


# Main function to execute all operations
def main():
    print(" Movies in the database:")
    read_movies()

    serch_movie()

    insert_movie()

    print(" Updated Movies in the database:")
    read_movies()

if __name__ == "__main__":
    main()
