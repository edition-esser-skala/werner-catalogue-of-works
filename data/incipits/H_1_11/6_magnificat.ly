\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Andante"
    r8 g'' e c a' f d g
    e c r4 r8 h' a g
    fis d h g' e c a d
    h c16 d e fis g a h8 g r4
    r16 g, a h c d e f g8 e r4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Andante"
    r8 e' c a~ a d h g~
    g g' f e d4. e8
    a,4 g2 fis4
    g16 d e fis g a h c d8 h r4
    r16 h c d e h c d e8 c r4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    c'2^\tutti d4. d8
    e g f e d4. e8
    a,[ d] h[ a16 g] a4.\trill a8
    h4 r r8 d d d
    d d r4 r8 e e d
  }
}

SopranoLyrics = \lyricmode {
  Ma -- gni -- fi --
  cat a -- ni -- ma me -- a
  Do -- _ _ mi --
  num, et ex -- ul --
  ta -- vit, et ex -- "ul -"
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    e2^\tutti a4 g
    g r r8 h a g
    fis fis g2 fis4
    g r r8 g g fis
    g g r4 r8 g g g
  }
}

AltoLyrics = \lyricmode {
  Ma -- gni -- fi --
  cat a -- ni -- ma
  me -- a Do -- mi --
  num, et ex -- ul --
  ta -- vit, et ex -- "ul -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    g4^\tutti c2 h4
    c8 e d c h g r4
    a g e' d
    d r r8 h d a
    h h r4 r8 c c h
  }
}

TenoreLyrics = \lyricmode {
  Ma -- gni -- fi --
  cat a -- ni -- ma me -- a,
  me -- a Do -- mi --
  num, et ex -- ul --
  ta -- vit, et ex -- "ul -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    c2^\tutti f4 g
    c, r r8 g' fis e
    d4 e c d
    g, r r8 g h d
    g g, r4 r8 c e g
  }
}

BassoLyrics = \lyricmode {
  Ma -- gni -- fi --
  cat a -- ni -- ma
  me -- a Do -- mi --
  num, et ex -- ul --
  ta -- vit, et ex -- "ul -"
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Andante"
    c4-\tutti a' f g
    c, r r8 g' fis e
    d4 e c d
    g, r r8 g h d
    g g, r4 r8 c e g
  }
}

BassFigures = \figuremode {
  r2 <6 5>
  r2 r8 <3> q q
  <_+>4 <5> <6 5> <_+>
  r2.. q8
  r1
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
