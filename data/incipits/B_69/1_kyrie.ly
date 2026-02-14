\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "Vivace"
    c'4 c2 a8 c f4 d
    h c r c2 h8 a
    h c d4 e2. d8 c
    d2. c8 h c4 d
    g, g c2. h8 a
    h2. c4 d2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "Vivace"
    r2 r r4 f~
    f e8 d e4 a e fis
    g2 r4 g e a~
    a d, r f! a g8 f
    e4 c r c g' a~
    a g2 e4 d h'
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/2 \tempoMarkup "Vivace" \autoBeamOff
    c'2. a4 f' d
    h c r c2 h8[ a]
    h[ c] d4 e2. d8[ c]
    d2. c8[ h] c4 d
    g, g c2. h8[ a]
    h2. c4 d2
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e e --
  lei -- son, e -- _
  lei -- _ _ _
  _ _ _ _
  son, e -- lei -- _
  son, __ _ _
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/2 \tempoMarkup "Vivace" \autoBeamOff
    r2 r r4 f~
    f e8[ d] e4 a e fis
    g2 r4 g e a~
    a d, r f! a g8[ f]
    e4 c r c g' a~
    a g2 e4 d h'
  }
}

AltoLyrics = \lyricmode {
  E --
  _ lei -- son, Ky -- ri --
  e e -- lei -- _
  son, e -- lei -- _
  _ son, e -- lei -- _
  _ _ son, "e -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/2 \tempoMarkup "Vivace" \autoBeamOff
    R1.*2
    r2 r r4 c~
    c h8[ a] h4 d a h
    c2 e2. d4~
    d h g2. d'4
  }
}

TenoreLyrics = \lyricmode {
  E --
  _ lei -- son, Ky -- ri --
  e e -- lei --
  _ son, "e -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "Vivace" \autoBeamOff
    R1.*2
    g'2. e4 c' a
    fis g r f2 e8[ d]
    e2. a4 e fis
    g2 e h
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e e --
  lei -- son, e -- _
  lei -- _ son, _
  Ky -- ri -- e
}

Organo = {
  \relative c {
    \clef soprano
    \key c \major \time 3/2 \tempoMarkup "Vivace"
    << {
      c''2._! a4_! f'_! d
      h c r c2 h8 a
    } \\ {
      s1-\tutti s4 f~
      f e8 d e4 a e fis
    } >>
    \clef bass g,2. e4 c' a
    fis g r f2 e8 d
    e2. a4 e fis
    g2 e h
  }
}

BassFigures = \figuremode {
  r1.
  r
  <5>2 <6>1
  <6 5>2. <6>4 <3> <5>
  <6>1 q4 <6 5>
  <9> <8> <5> <6> r2
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
