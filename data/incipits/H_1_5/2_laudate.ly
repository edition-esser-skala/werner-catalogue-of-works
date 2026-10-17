\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Presto mà moderato"
    R1*2
    r2 r8 g''\p g g
    f es f c es4 d
    c r r2
    R1
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Presto mà moderato"
    R1
    r8 c'\p c c h a h g
    es'2 d4 g,
    c2~ c8 h16 a h4
    c r r2
    R1
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Presto mà moderato"
    R1*3
    r4 c'^\solo^\aTre c h
    c8[ d] es4 d4. d8
    g,2 r8 a a a
  }
}

SopranoLyrics = \lyricmode {
  Sit no -- men
  Do -- _ _ mi --
  ni, sit be -- "ne -"
}

Alto = {
  \relative c' {
    \clef alto
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Presto mà moderato"
    R1*5
    r4 g'^\solo g fis
  }
}

AltoLyrics = \lyricmode {
  Sit no -- men
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Presto mà moderato"
    R1*4
    r4 c^\solo c h
    c8[ d] es4 d d8 c
  }
}

TenoreLyrics = \lyricmode {
  Sit no -- men
  Do -- _ _ mi -- ni
}

Basso = {
  \relative c {
    \clef bass
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Presto mà moderato"
    r4 g^\solo c4. d8
    es4 es8 f g4. g8
    c, c' c c b![ as] b[ g]
    as4. as8 g4 r
    R1*2
  }
}

BassoLyrics = \lyricmode {
  Lau -- da -- te
  pu -- e -- ri Do -- mi --
  num, lau -- da -- te no -- men
  Do -- mi -- ni.
}

Organo = {
  \relative c {
    \clef bass
    \key c \dorian \time 4/4 \tempoMarkup "Presto mà moderato"
    c8-\solo c' g f es d c4~
    c8 b as4 g2
    c8 c' c c b! as b g
    as2 g4. f8
    es d c4 g'2
    c8 d es4 d4. c8
  }
}

BassFigures = \figuremode {
  r1
  r4 <5>8 <6> <_!>2
  r1
  <6 3>2 <6 4>4 <5 _!>
  <6>2 <4>4 <_!>
  r <6> <4> <_+>
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
