\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Spirituoso"
    a'8.\f\trill f32 e d8 d d'8.\trill f,32 e d8 d \gotoBar "5"
    d'16 d'-! c-! b-! a-! g-! f-! e-! d16.\trill cis64( d) \tuplet 3/2 8 { a16[\trill g a] f\trill e f } d8
    r2 a'8.\p\trill f32 e d8 d
    r2 c'8.\trill a32 g f8 f
    r4 r8 a' b, g' a, f'
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Spirituoso"
    a'8.\f\trill f32 e d8 d d'8.\trill f,32 e d8 d \gotoBar "5"
    d'16 d'-! c-! b-! a-! g-! f-! e-! d16.\trill cis64( d) \tuplet 3/2 8 { a16[\trill g a] f\trill e f } d8
    r2 a'8.\p\trill f32 e d8 d
    r2 c'8.\trill a32 g f8 f
    r4 r8 a' b, g' a, f'
  }
}

Soli = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Spirituoso"
    R1 \gotoBar "5"
    r2 r4 r8 d
    a' a a16[ g] a[ e] f8 d r d'
    c!16[ g] e[ c] b'8. b16 a4 r8 a
    d, b' c, a' b, g' r h
  }
}

SoliLyrics = \lyricmode {
  Hier
  hab ich ei -- ne Pil -- len die
  wegt biß ze -- hen Pfund, wer
  will ſein Kranck -- heit ſtil -- len wird
}

Continuo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Spirituoso"
    d8 d'4 c8 b, b'4 f8 \gotoBar "5"
    f g a a, d a f d
    r cis' a cis d8. e16 f8 d
    e c d e f8. g16 a8 f
    b g a f g e f d
  }
}

BassFigures = \figuremode {
  r1
  <6>4 <6 4>8 <5 _+> r2
  r1
  <6>4 <6>8 <\t> r2
  r2.. <6!>8
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
