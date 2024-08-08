\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "Allabreve moderato"
    R1*4
    g'2 c
    a d
    h e4. d8
    c4 h8[ a] h4 d8[ c]
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri --
  e e --
  lei -- _ _
  _ _ son, "e -"
}

Alto = {
  \relative c' {
    \clef alto
    \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "Allabreve moderato"
    r2 r4 e8[ c]
    a4 f' r f8[ d]
    h4 g' r g8[ e]
    c[ d e c] f[ e] d4
    e2. e4
    fis2. fis4
    g2. g4~
    g fis g2
  }
}

AltoLyrics = \lyricmode {
  E --
  lei -- son, e --
  lei -- son, e --
  lei -- _ _
  son, e --
  lei -- son,
  e -- lei --
  _ son,
}

Tenore = {
  \relative c' {
    \clef tenor
    \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "Allabreve moderato"
    r4 g2 c4~
    c a2 d4~
    d h2 e4~
    e8[ d] c2 h4
    c g a c
    d a h d
    e h c8[ h c d]
    e4 d d2
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri --
  e e --
  lei -- _
  _ _
  son, e -- lei -- _
  _ _ _ _
  _ _ _
  _ _ son,
}

Basso = {
  \relative c {
    \clef bass
    \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "Allabreve moderato"
    r2 c
    f d
    g e
    a4. g8 f4 g8[ f]
    e[ f e d] c[ a a' g]
    fis[ g fis e] d[ h h' a]
    g[ a g fis] e[ d c h]
    a4 d g,2
  }
}

BassoLyrics = \lyricmode {
  Ky --
  ri -- e
  e -- lei --
  son, __ _ _ e --
  lei -- _
  _ _
  _ _
  _ _ son,
}

Organo = {
  \relative c {
    \clef bass
    \twotwotime \key c \major \time 2/2 \tempoMarkup "Allabreve moderato"
    << { r4 g'2 c4 } \\ { r2 c, } >>
    f d
    g e
    a4. g8 f4 g8 f
    e f e d c a a' g
    fis g fis e d h h' a
    g a g fis e d c h
    a4 d g,2
  }
}

BassFigures = \figuremode {
  r2. <3>4
  <5 3>1
  r
  r2 <6 5>
  <6> q
  q <6>
  <6>1
  r4 <_+>2.
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

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
