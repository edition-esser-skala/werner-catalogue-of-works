\version "2.24.2"
\include "header.ly"

Alto = {
  \relative c' {
    \clef alto
    \key e \minor \time 4/4 \autoBeamOff \tempoMarkup "Larghetto"
    e4.^\solo dis8 g4 fis
    r8 e e[ d] c4 h8 g'
    g[ fis] e fis g8. g16 fis8 fis
    gis a4 \hA gis8 a e fis8. fis16
    g8 d e8. e16 fis4 fis
  }
}

AltoLyrics = \lyricmode {
  Be -- ne -- di -- ctus,
  qui ve -- _ nit, qui
  ve -- nit in no -- mi -- ne Do --
  _ _ mi -- ni, in no -- mi --
  ne, in no -- mi -- ne "Do -"
}

Basso = {
  \relative c {
    \clef bass
    \key e \minor \time 4/4 \autoBeamOff \tempoMarkup "Larghetto"
    r2 e4.^\solo dis8
    g4 fis r8 a a[ g]
    a16[ d,] d'4 c8 h cis d8. c16
    h8[ c] h8. h16 a4 r8 a
    h8. h16 c8 g a8. a16 h8.[ a16]
  }
}

BassoLyrics = \lyricmode {
  Be -- ne --
  di -- ctus, qui ve --
  _ _ _ nit in no -- mi --
  ne __ Do -- mi -- ni, in
  no -- mi -- ne, in no -- mi -- ne __
}

Organo = {
  \relative c {
    \clef bass
    \key e \minor \time 4/4 \tempoMarkup "Larghetto"
    e8-\solo^\aTre g a h e, g a h
    e, e, h' h' e, fis g g,
    d' d' a a, e'4 h
    e8 a d, e a, c d d,
    g g' c,4 a8 fis' dis h
  }
}

BassFigures = \figuremode {
  r4. <_+> <6 5>8 <_+>
  r4 <4>8 <3> <6> <\t> <9> <8>
  <4> <3> <4> <3> <5> <6\\>4.
  <_+>4 <6 5>8 <_+>4. r4
  r2 <6\\>4 <6>
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
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
