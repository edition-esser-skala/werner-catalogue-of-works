\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "Vivace"
    r4 g'' g g a8 c, f a
    g c, e g f a, d f e a, cis e
    f d f a d d, f a h, d g d
    e g c e, d4 c' g, h'
    c2 r r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "Vivace"
    r4 e' e e c8 a c f
    e g, c e d f, a d cis a \hA cis e
    f d f a d d, f a h, d g d
    e g c e, d4 c' g, h'
    c2 r r
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    r4 c'^\tutti c c c4. c8
    c2 a4 d cis2
    r4 d d d h h
    c!2. h8[ a] h2
    c4 g^\solo a h c2~
  }
}

SopranoLyrics = \lyricmode {
  Lau -- da -- te pu -- e --
  ri Do -- mi -- num,
  lau -- da -- te no -- men
  Do -- _ mi --
  ni. Sit no -- men Do --
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    r4 g'^\tutti g g a4. a8
    g2 f4. f8 e2
    r4 f f f g2~
    g4 g g2. g4
    g2 r r
  }
}

AltoLyrics = \lyricmode {
  Lau -- da -- te pu -- e --
  ri Do -- mi -- num,
  lau -- da -- te no --
  men Do -- mi --
  ni.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    r4 e^\tutti e e c4. c8
    e2 d4 a a2
    r4 a a d d2
    e d2. d4
    e2 r r
  }
}

TenoreLyrics = \lyricmode {
  Lau -- da -- te pu -- e --
  ri Do -- mi -- num,
  lau -- da -- te no --
  men Do -- mi --
  ni.
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    r4 c^\tutti c c f4. f8
    c2 d4. d8 a2
    r4 d d d g2
    c, g2. g4
    c2 r r
  }
}

BassoLyrics = \lyricmode {
  Lau -- da -- te pu -- e --
  ri Do -- mi -- num,
  lau -- da -- te no --
  men Do -- mi --
  ni.
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "Vivace"
    c2.-\tutti c4 f2
    c d a
    d2. d4 g2
    c, g1
    c2 f4-\solo d a' g8 f
  }
}

BassFigures = \figuremode {
  r1.
  r1 <_+>2
  r1.
  r2 <4> <3>
  r2. <6>
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
