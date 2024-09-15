\version "2.24.2"
\include "header.ly"

ClarinettoI = {
  \relative c' {
    \clef treble
    \key c \major \time 2/2 \tempoMarkup "Adagio"
    R1
    r4 c'\p e c
    d r r2
    r4 d f d \gotoBar "9"
    R1
    r4 c e c
    d r r2
    r4 d f d
    e2 d
    c \pao c
  }
}

ClarinettoII = {
  \relative c' {
    \clef treble
    \key c \major \time 2/2 \tempoMarkup "Adagio"
    R1
    r4 e g e
    h' r r2
    r4 h d h \gotoBar "9"
    R1
    r4 e, g e
    h' r r2
    r4 h d h
    c2 h
    a r
  }
}

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 2/2 \tempoMarkup "Adagio"
    R1*4 \gotoBar "9"
    R1
    r4 c'2\p c4
    d r r2
    r4 d2 d4
    c r r2
    R1
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 2/2 \tempoMarkup "Adagio"
    R1*4 \gotoBar "9"
    R1
    r4 e2\p e4
    g r r2
    r4 g2 g4
    e r r2
    R1
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 2/2 \tempoMarkup "Adagio"
    R1*4 \gotoBar "9"
    R1*6
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 2/2 \tempoMarkup "Adagio"
    c'4 g fis8( g a g)
    g4 c-! e-! c-!
    d-! g,-! fis8( g a g)
    g4 d'-! f-! d-! \gotoBar "9"
    c g fis8( g a g)
    g4 c-! e-! c-!
    d g, fis8( g a g)
    g4 d'-! f-! d-!
    e4.( e8) g4.( h,8)
    c4.( c8) a'4.( fis8)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 2/2 \tempoMarkup "Adagio"
    e4 g fis8 g a g
    g4 e << { e e } { g,2.*2/3 } >>
    f'4 g fis8 g a g
    g4 f << { f f } { g,2.*2/3 } >> \gotoBar "9"
    e'4\p g fis8 g a g
    g4 <e g,> q q
    f g fis8 g a g
    g4 f << { f f } { g,2.*2/3 } >>
    g'2 f
    e a
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 2/2 \tempoMarkup "Adagio" \autoBeamOff
    R1*4 \gotoBar "9"
    c'4 g fis8[ g] a[ g]
    g4 c e c
    d g, fis8[ g] a[ g]
    g4 d' f d
    e2 d
    c d4. d8
  }
}

SopranoLyrics = \lyricmode {
  Ky -- _ _ ri --
  e e -- lei -- _
  _ son, Ky -- ri --
  e e -- lei -- _
  son, e --
  lei -- son, "e -"
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 2/2 \tempoMarkup "Adagio" \autoBeamOff
    R1*4 \gotoBar "9"
    R1
    r4 e g e
    g r r2
    r4 g g2
    g f
    e f4. f8
  }
}

AltoLyrics = \lyricmode {
  E -- lei -- _
  son,
  e -- lei --
  son, e --
  lei -- son, "e -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 2/2 \tempoMarkup "Adagio" \autoBeamOff
    R1*4 \gotoBar "9"
    R1
    r4 g g2
    h4 r r2
    r4 h d h
    c2 h
    a a4. a8
  }
}

TenoreLyrics = \lyricmode {
  E -- lei --
  son,
  e -- lei -- _
  son, e --
  lei -- son, "e -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 2/2 \tempoMarkup "Adagio" \autoBeamOff
    R1*4 \gotoBar "9"
    R1
    r4 c e c
    g' r r2
    r4 g h g
    c2 g
    a2 f4. f8
  }
}

BassoLyrics = \lyricmode {
  E -- lei -- _
  son,
  e -- lei -- _
  son, e --
  lei -- son, "e -"
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 2/2 \tempoMarkup "Adagio"
    R1
    r4 c\p e c
    <g' g,> r r2
    r4 g, h g \gotoBar "9"
    c' r r2
    r4 c,-\tutti e c
    <g' g,> r r2
    r4 g, h g
    c2 g'
    a f
  }
}

BassFigures = \figuremode {
  r1
  r
  <5>
  r4 <5>2.
  r1
  r
  <5 3>
  r4 <5 3>2.
  <3>2 <5>
  q q4 <6>
}

\score {
  <<
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "cl" "1, 2" }
        \partCombine #'(0 . 10) \ClarinettoI \ClarinettoII
      }
    >>
    \new StaffGroup <<
      \new Staff <<
        \set Staff.instrumentName = \markup \center-column { "clno" "1, 2" }
        \partCombine #'(0 . 10) \ClarinoI \ClarinoII
      >>
    >>
    \new Staff {
      \set Staff.instrumentName = "timp"
      \Timpani
    }
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
