\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Vivace"
    r16 b\f d16. f32 \sbOn \tuplet 3/2 8 { b16 d f } b16. d32 \sbOff \appoggiatura d16 c16. b32 \appoggiatura b16 a16. g32 \appoggiatura g16 f16. es32 \appoggiatura es16 d16. c32 \gotoBar "7"
    \sbOn \tuplet 6/4 4 { b16 b' f d b f } d4 r2
    r4 r8 f'~ \tuplet 6/4 4 { f16 d b d b f b f d f d b } \sbOff
    r2 a'32 a' g f e d c b a8 f
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Vivace"
    r16 d'\f b16. f32 d16. b32 d'16. b'32 \appoggiatura b16 a16. g32 \appoggiatura g16 f16. es32 \appoggiatura es16 d16. c32 \appoggiatura c16 b16. a32 \gotoBar "7"
    \sbOn \tuplet 6/4 4 { b16 f' d b f d } b4 r2
    r4 r8 f''~ \tuplet 6/4 4 { f16 d b d b f b f d f d b } \sbOff
    r2 f'32 f' e d c b a g f8 a,
  }
}

Soli = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    R1 \gotoBar "7"
    r4 r8 b b' f b d
    c16.[ b32 a16. g32] f16.[ es32 d16. c32] d8 b r d'
    e, c' c, b' a f, r a'
  }
}

SoliLyrics = \lyricmode {
  Du Him -- mel nicht ver --
  weil -- _ _ le mit
  Blitz und Don -- ner -- keu -- le "zer -"
}

Continuo = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \tempoMarkup "Vivace"
    b'8 b, r b f' f, r f' \gotoBar "7"
    b,4 r b8 b16 c d8 b
    f'4 a, b r
    c e f r
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r
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
        \set Staff.instrumentName = "Gerecht."
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
