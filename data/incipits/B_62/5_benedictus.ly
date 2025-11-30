\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "[no tempo]"
    r8 e'16 h h a g fis g8 e e dis
    e g'16 a h8 c~ c16 a h8~ h16 g a8~
    a16 fis g e fis8 g \sbOn \tuplet 3/2 8 { e16 fis g a h c \sbOff } fis,8 g \gotoBar "7"
    g,4 r r2
    r8 e'16 h h a g fis e4 r
    R1
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "[no tempo]"
    r2 r8 e'16 h h a g fis
    g8 e4 e'8 fis g~ g16 e fis8~
    fis16 d e cis d4~ d8 c c h \gotoBar "7"
    e,4 r r2
    r8 e'16 h h a g fis e4 r
    R1
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1*3 \gotoBar "7"
    e2^\solo fis
    g a4 g
    g fis r2
  }
}

SopranoLyrics = \lyricmode {
  Be -- ne --
  di -- ctus, qui
  ve -- nit
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1*3 \gotoBar "7"
    e2.^\solo dis4
    e g8 g g[ fis] fis e
    e4 dis r g
  }
}

AltoLyrics = \lyricmode {
  Be -- ne --
  di -- ctus, qui ve -- nit, qui
  ve -- nit in
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1*3 \gotoBar "7"
    R
  }
}

TenoreLyrics = \lyricmode {
  %tacet
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1*3 \gotoBar "7"
    R
  }
}

BassoLyrics = \lyricmode {
  %tacet
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "[no tempo]"
    e4-\solo dis e8 g a h
    e,4 g8 a d,! r d r
    d r r h c4 d8 e \gotoBar "7"
    e8 g g e a ais h h,
    e e, e' e cis dis e e,
    h' h' h a g fis e d
  }
}

BassFigures = \figuremode {
  r4 r4. <6>4 <_+>8
  r4 <6> <7> <6 4>
  <5 3>4. <6>8 <9> <8 6> <7>4
  r2 <6 5>
  r <6 5>
  <6 4>4 <5 _+> <6>2
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
