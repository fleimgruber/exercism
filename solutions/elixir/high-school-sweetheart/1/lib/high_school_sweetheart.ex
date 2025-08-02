defmodule HighSchoolSweetheart do
  def first_letter(name) do
    String.trim(name) |> String.first
  end

  def initial(name) do
    (first_letter(name) |> String.upcase) <> "."
  end

  def initials(full_name) do
    [first, last] = String.split(full_name, " ")
    initial(first) <> " " <> initial(last)
  end

  def pair(full_name1, full_name2) do
    ini1 = initials(full_name1)
    ini2 = initials(full_name2)
    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{ini1}  +  #{ini2}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end
end
