\version "2.24.2"
\include "header.ly"

BassoI = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    c'2^\solo c4 c
    c c,8 c' c16[ h c8] c, c'
    h16[ c d h] g[ a h g] e[ f g e] c8 g'
    a16[ g f e] f[ g a b] g[ f e d] e[ f g a]
    f8[ d h g] c4 r8 e'
  }
}

BassoILyrics = \lyricmode {
  Re -- gi -- na
  coe -- li, lae -- ta -- re, lae --
  ta -- _ _ re, lae --
  ta -- _ _ _
  _ re, "lae -"
}

BassoII = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    R1*2
    r2 c'^\solo
    c4 c c c,8 c'
    h16[ c d h] g[ a h g] e8 c c'16[ g e c]
  }
}

BassoIILyrics = \lyricmode {
  Re --
  gi -- na coe -- li, lae --
  ta -- _ re, lae -- "ta -"
}


Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c'8-\solo c, e g c e c g
    e c e g c16 g e g e c e f
    g8 d h g c d e c
    f a c f, e g c e,
    d4 h8 g c c' e, c
  }
}

BassFigures = \figuremode {
  r4. <\t>2 q8
  r4. q8 r2
  r8 q2..
  r2 r8 <\t>4.
  <6>1
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "B 1"
        \new Voice = "BassoI" { \dynamicUp \BassoI }
      }
      \new Lyrics \lyricsto BassoI \BassoILyrics

      \new Staff {
        \set Staff.instrumentName = "B 2"
        \new Voice = "BassoII" { \dynamicUp \BassoII }
      }
      \new Lyrics \lyricsto BassoII \BassoIILyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
