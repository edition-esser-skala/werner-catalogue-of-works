\version "2.24.2"
\include "header.ly"

TromboneI = {
  \relative c' {
    \clef alto
    \key c \dorian \time 4/4 \tempoMarkup "Largo"
    r2 e8-\tutti c e g
    f g16 f es8 d es4 r
    e8 e e e d4 r
    R1
    d4 g2 f!4
  }
}

TromboneII = {
  \relative c' {
    \clef tenor
    \key c \dorian \time 4/4 \tempoMarkup "Largo"
    c2-\tutti c,
    r8 c' h d c es4 c8
    b4.\trill b8 a! d, fis a
    d a fis d b'2~
    b~ b8 c d4
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Largo"
    r4 g'2-\tutti c8 b
    as b16 as g8 f g4 r
    g8 g g16( fis) g8 fis4 r
    R1
    g4. g8 g a h4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Largo"
    r4 g'2-\tutti c8 b
    as b16 as g8 f g4 r
    g8 g g16( fis) g8 fis4 r
    R1
    g4. g8 g a h4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    r4 g'2^\tutti c8[ b]
    as[ b16 as] g8[ f] g4 r
    g8 g g16[ fis] g8 fis4 r
    R1
    g4. g8 g[ a] h4
  }
}

SopranoLyrics = \lyricmode {
  Ho -- mo
  na -- _ tus
  de mu -- li -- e -- re

  bre -- vi vi -- vens
}

Alto = {
  \relative c' {
    \clef alto
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    r2 e8[^\tutti c] e[ g]
    f[ g16 f] es8[ d] es4 r
    e8 e e e d4 r
    R1
    d4 g g f!
  }
}

AltoLyrics = \lyricmode {
  Ho -- mo
  na -- _ tus
  de mu -- li -- e -- re

  bre -- vi vi -- vens
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    c2^\tutti c,
    r8 c' h16[ c] d8 c es4 c8
    b4.\trill b8 a! d,[ fis] a
    d[ a] fis[ d] b'2~
    b~ b8[ c] d4
  }
}

TenoreLyrics = \lyricmode {
  Ho -- mo
  na -- _ _ tus de mu --
  li -- e -- re bre -- vi,
  bre -- vi vi --
  vens
}

Basso = {
  \relative c {
    \clef bass
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    r2 c4.^\tutti c8
    c2 c4 r
    cis8 cis cis cis d4 r
    r2 r8 g,[ b] d
    g[ d] b[ g] es'4 d
  }
}

BassoLyrics = \lyricmode {
  Ho -- mo
  na -- tus
  de mu -- li -- e -- re
  bre -- vi,
  bre -- vi vi -- vens
}

Organo = {
  \relative c {
    \clef bass
    \key c \dorian \time 4/4 \tempoMarkup "Largo"
    c2~-\tutti c~
    c~ c4 r
    cis8 cis cis cis d4 r
    r2 r8 g, b d
    g d b g es'4 d
  }
}

BassFigures = \figuremode {
  r2 <_!>
  <6- 4>4 <7! \t> <8 _->2
  <7-> <_+>
  r2 r8 <_->4 <\t>8
  r q4. <5>8 <6> <6!>4
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "trb"
        \new Staff {
          \set Staff.instrumentName = "1"
          \TromboneI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \TromboneII
        }
      >>
    >>
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
