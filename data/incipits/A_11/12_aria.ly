\version "2.24.2"
\include "header.ly"

Viola = {
  \relative c' {
    \clef treble
    \key c \dorian \time 3/4 \tempoMarkup "Largo"
    g''4. f16 es \tuplet 3/2 4 { d8 es f }
    es8. g,16 c,4 r \gotoBar "22"
    c2 r4
    R2.*3
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \dorian \time 3/4 \tempoMarkup "Largo"
    \after 4*0 ^\conSord R2.
    g'4. f16 es \tuplet 3/2 { d8 es f }\gotoBar "22"
    es2 r4
    R2.
    g4. f16 es \tuplet 3/2 4 { d8 es f }
    es4 r r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \dorian \time 3/4 \tempoMarkup "Largo"
    \after 4*0 ^\conSord R2.
    es4. d16 c \tuplet 3/2 4 { h8 c d } \gotoBar "22"
    c2 r4
    R2.
    es4. d16 c \tuplet 3/2 4 { h8 c d }
    c4 r r
  }
}

Soli = {
  \relative c' {
    \clef tenor
    \key c \dorian \time 3/4 \autoBeamOff \tempoMarkup "Largo"
    R2.*2 \gotoBar "22"
    g4 c es
    d8.[ es16] f4 h,
    \appoggiatura h8 c2 r4
    es \tuplet 3/2 4 { d8[ c b] c[ b as] }
  }
}

SoliLyrics = \lyricmode {
  Mach ſich nur
  kei -- _ ner
  grecht!
  dan wer da
}

Continuo = {
  \relative c {
    \clef bass
    \key c \dorian \time 3/4 \tempoMarkup "Largo"
    c4 es g
    c, es g \gotoBar "22"
    c,2 r4
    f d g
    c, es g
    c, b! as
  }
}

BassFigures = \figuremode {
  r2 <_!>4
  r2 q4
  r2.
  <6>2 <_!>4
  r2 q4
  r2.
}

\score {
  <<
    \new Staff {
      \set Staff.instrumentName = \markup \center-column { "vla" "d’amore" "solo" }
      \Viola
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
        \set Staff.instrumentName = \markup \center-column { "Gehorſamer" "Sohn" }
        \new Voice = "Soli" { \dynamicUp \Soli }
      }
      \new Lyrics \lyricsto Soli \SoliLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
