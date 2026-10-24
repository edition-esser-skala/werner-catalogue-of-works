\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Spirituoso"
    f16.\f a32 c16. a32 f'8 f a8.\trill g32 f e8 d \gotoBar "4"
    a16( f) d g \grace f8 e8.\trill f16 f16 c'32( b) a16. g32 f4
    R1
    r2 a16.\trill\p g64( a) c16.[\trill b64( c)] f16.\trill e64( f) a8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Spirituoso"
    f16.\f a32 c16. a32 f'8 f a8.\trill g32 f e8 d \gotoBar "4"
    a16( f) d g \grace f8 e8.\trill f16 f16 c'32( b) a16. g32 f4
    R1
    r2 f16.\trill\p e64( f) a16.[\trill g64( a)] c16.\trill b64( c) f8
  }
}

Soli = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Spirituoso"
    R1 \gotoBar "4"
    r2 r4 c'8 a
    f c a c f16[ e] f8 f \tuplet 3/2 8 { a16[ b c] }
    b[ a] g[ f] e[ d] c[ b'] a8 r f a
  }
}

SoliLyrics = \lyricmode {
  Hoch und
  mit -- le nied -- re Sten -- de brau -- chen
  mi und ſänd gar froh, ſprö -- chen
}

Continuo = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Spirituoso"
    f8\f a d,8. c32 b a8 f c' b \gotoBar "4"
    f' b c c, f c16. b32 a8 f
    f'4.\p e8 d c16 b a8 f
    g b c e f c a f
  }
}

BassFigures = \figuremode {
  r1
  r8 <6> <4> <3>4 <6>16. q32 q4
  r1
  r2 r8 <\t>4.
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
        \set Staff.instrumentName = "Sagfäller"
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
