\version "2.24.2"
\include "header.ly"

ViolinoPrincipale = {
  \relative c' {
    \clef treble
    \key d \major \time 3/8 \tempoMarkup "Allegro"
    d'4.~
    d4 \tuplet 3/2 8 { d16 e fis }
    g8 fis e
    d4 \tuplet 3/2 8 { d16 e fis }
    g8 fis e
    d cis h
    a4 fis16 d
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 3/8 \tempoMarkup "Allegro"
    d'4.~
    d4 \tuplet 3/2 8 { d16 e fis }
    g8 fis e
    d4 \tuplet 3/2 8 { d16 e fis }
    g8 fis e
    d cis h
    a4 fis16 d
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 3/8 \tempoMarkup "Allegro"
    d'4.~
    d4 \tuplet 3/2 8 { d16 e fis }
    g8 fis e
    d4 \tuplet 3/2 8 { d16 e fis }
    g8 fis e
    d cis h
    a4 fis16 d
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key d \major \time 3/8 \tempoMarkup "Allegro"
    fis8 g a
    fis g a
    h a g
    fis g a
    h a g
    fis e d
    cis16( h) cis8 d
  }
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 3/8 \tempoMarkup "Allegro"
    << {
      d'4.~\trill
      d4~\trill \tuplet 3/2 8 { d16 e fis }
      g8 fis e
      d4~\trill \tuplet 3/2 8 { d16 e fis }
      g8 fis e
      d cis h
      a4 s8
    } \\ {
      d,8 e fis
      d e fis
      g fis e
      d e fis
      g fis e
      d cis h
      a a' d,
    } >>
  }
}

BassFigures = \figuremode {
  r4.
  r
  r
  r
  r
  r
  r
}

\score {
  <<
    \new Staff {
      \set Staff.instrumentName = "vl princ"
      \ViolinoPrincipale
    }
    \new StaffGroup <<
      \new GrandStaff \with { \smallGroupDistance } <<
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
      \new Staff {
        \set Staff.instrumentName = "vla"
        \Viola
      }
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
