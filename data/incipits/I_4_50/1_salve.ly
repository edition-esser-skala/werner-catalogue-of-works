\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Largo"
    r4 <d fis a>8\pp fis r4 <d a' fis'>8 d'
    R1
    \time 3/4 \tempoMarkup "Larghetto" cis16(\pp e) r8 cis16( e) r8 cis16( e) r8
    e16( g) r8 e16( g) r8 e16( g) r8
    fis16( a) r8 d,16( fis) r8 a,16( c) r8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Largo"
    r4 <d fis a>8\pp fis r4 <d a' fis'>8 d'
    R1
    \time 3/4 \tempoMarkup "Larghetto" a16(\pp cis) r8 a16( cis) r8 a16( cis) r8
    cis16( e) r8 cis16( e) r8 cis16( e) r8
    d16( fis) r8 a,16( d) r8 fis,16( a) r8
  }
}

ViolaI = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \tempoMarkup "Largo"
    R1*2
    \time 3/4 \tempoMarkup "Larghetto" r8 e16(\pp g) r8 e16( g) r8 g16( e)
    r8 e16( cis) r8 e16( cis) r8 g'16( e)
    r8 fis16( d) r8 a'16( fis) r8 fis16( d)
  }
}

ViolaII = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \tempoMarkup "Largo"
    R1*2
    \time 3/4 \tempoMarkup "Larghetto"
      r8 cis16(\pp e) r8 cis16( e) r8 e16( cis)
    r8 cis16( a) r8 cis16( a) r8 e'16( cis)
    r8 d16( a) r8 fis'16( d) r8 c16( a)
  }
}

Soprano = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Largo" \autoBeamOff
    \mvTr d8~[\trill\pE^\solo d32 cis d e] fis16.[\trill e32 d e fis g] a16.[\trill g32 fis g a64 h cis32] d[ e fis g a g fis e]
    d16[ d,\trill fis\trill a]\trill d32[ cis h a g fis e d] a'8 e r4
    \time 3/4 \tempoMarkup "Larghetto"
      \sbOn a2~ a32([ gis a h) cis16 d] \sbOff
    e8[ fis] g!2
    fis8[ a32( g fis e)] d4 r
  }
}

SopranoLyrics = \lyricmode {
  Sal -- _ _ _
  _ _ _ ve,
  sal --
  _ _
  _ ve,
}

Chords = {
  \relative c' {
    \clef soprano
    \key d \major \time 4/4 \tempoMarkup "Largo"
    \after 4*0 ^\markup \remark "con Flautino" R1*2
    \time 3/4 \tempoMarkup "Larghetto" R2.*2
    r4 d8 fis \sbOn a16 c \tuplet 3/2 8 { e d \hA c }
  }
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Largo"
    d8-\solo d, r4 d'8 d, r4
    d''16-\markup \remark "organo solo allo unisono" d,\trill fis\trill a\trill d32 cis h a g fis e d a'8\trill e\trill cis\trill e\trill
    \time 3/4 \tempoMarkup "Larghetto" \mvTr a,\p-\tasto r a r a r
    cis r a r cis r
    d r fis r d r
  }
}

\score {
  <<
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
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vla"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolaI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolaII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics
    >>
    \new PianoStaff <<
      \set PianoStaff.instrumentName = \markup \center-column { "org" "solo" }
      \new Staff { \Chords }
      \new Staff {
        \set Staff.instrumentName = "b"
        \Organo
      }
    >>
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
