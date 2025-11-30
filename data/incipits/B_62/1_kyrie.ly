\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \tempoMarkup "Allegro"
    d'8. d16 d8 c h g e' d
    d4. c16 h h4 a8 h16 c
    d8 h c h a4 g
    c4. h16 a h8 e d c16 h
    h4 a g d'~
    d8 d e d cis16 a \hA cis e fis8 fis
  }
}

ViolinoII = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \tempoMarkup "Allegro"
    d'8. d16 d8 c h g e' d
    d4. c16 h h4 a8 h16 c
    d8 h c h a4 g
    c4. h16 a h8 e d c16 h
    h4 a g d'~
    d8 d e d cis16 a \hA cis e fis8 fis
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    d'8.^\tutti d16 d8 c h[ g] e' d
    d4 d8 c16[ h] h4 a8 h16[ c]
    d8[ h] c h a4 g
    c4. h16[ a] h8[ e] d c16[ h]
    h4 a g d'~
    d8 d e d cis4 fis8 fis
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son, e --
  lei -- son, e -- lei -- son, e --
  lei -- son, e -- lei -- _
  _ _ _ son, e --
  lei -- _ son, Ky --
  ri -- e e -- lei -- son, "e -"
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    r2 g'8.^\tutti g16 g8 g
    fis[ d] h' a g[ fis16 e] fis8 g
    g2 a8[ fis] d g
    g[ fis16 e] fis4 g g
    g fis g r
    g4. g8 a g a4
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e e --
  lei -- son, e -- lei -- son, e --
  lei -- _ son, e --
  lei -- _ son, e --
  lei -- _ son,
  Ky -- ri -- e e -- "lei -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    R1
    r2 d8.^\tutti d16 d8 c
    h[ g] e' d d4 d8 e
    e4 d d8 c h d
    d4. c8 h4 r
    r2 r4 d~
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e e --
  lei -- son, e -- lei -- son, e --
  lei -- son, Ky -- ri -- e e --
  lei -- _ son,
  "Ky -"
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    R1*2
    g'8.^\tutti g16 g8 g fis[ d] h' a16[ g]
    a4 d, g g
    d2 g,4 r
    R1
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son, e --
  lei -- _ son, e --
  lei -- son,
}

Organo = {
  \relative c {
    \clef soprano
    \key g \major \time 4/4 \tempoMarkup "Allegro"
    d''8.-!-\tutti d16-! d8-! c-! g8. g16 g8 g
    fis d h' a \clef tenor d,4. c8
    \clef bass g8. g16 g8 g fis d h' a16 g
    a4 d, g g
    d2 g,4 \clef soprano << {
      d'''~
      d8 d e d cis4
    } \\ {
      r4
      g4. g8 a[ g]
    } >> \clef tenor d4~
  }
}

BassFigures = \figuremode {
  r2 <3>4 <6>8 <5>
  <6>4 <3>8 q <6 4>4 <5 3>
  r4 <6 4>8 <5 3> r4 <6>
  <7> q <3>8 <4> <5>4
  <6 4> <5 3>2.
  r16
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
    >>
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
