\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Andante"
    r8 d'\f d, d' c16 d c b a g f es
    d8 f'16. f,32 g8 es'16. es,32 f8 d'16. d,32 es8 c'16. c,32 \gotoBar "5"
    b'4 r r8 c\p \tuplet 3/2 8 { a16\trill g a c[\trill b c]
    d\trill c d b[\trill a b] f\trill es f } d8 r2
    r8 \tuplet 3/2 8 { a''16\trill g a f\trill e f c[\trill b c] a\trill g a } a8 r4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Andante"
    r8 b'\f b, b' a16 b a g f es d c
    b8 b'~ b16. g32 g8\trill b16. f32 f8\trill b16. es,32 es8\trill \gotoBar "5"
    b'4 r r8 a\p \tuplet 3/2 8 { f16[\trill es f] a\trill g a
    b[\trill a b] f\trill es f d\trill c d } b8 r2
    r8 \tuplet 3/2 8 { f''16\trill e f c[\trill b c] a\trill g a f\trill e f } f8 r4
  }
}

Soli = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*2 \gotoBar "5"
    r8 b' b, b' a16[ b] a[ g] f[ es] d[ c]
    b4 r8 f' g a16[ b] c[ g] e[ c]
    \tuplet 3/2 8 { a'[ g f] } f8 r4 r8 c' f, a
  }
}

SoliLyrics = \lyricmode {
  Ist et -- wann ein be -- tag -- te
  Frau mit neun -- zig Jahr zu --
  ge -- gen, die mach ich
}

Continuo = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \tempoMarkup "Andante"
    b4\f r8 b f'4 f,
    b8 d es c' d, b' c, a' \gotoBar "5"
    b,4 r8 b f'4 f,
    b r8 d es4 e8 c
    f4 r f4. es8
  }
}

BassFigures = \figuremode {
  r1
  r
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
        \set Staff.instrumentName = "Arzt"
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
