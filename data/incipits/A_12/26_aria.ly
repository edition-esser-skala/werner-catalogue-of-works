\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Andante"
    r4 f'8\f f, b b'~ b16 g f es
    \tuplet 3/2 8 { d16 c b } b8 f'16( b,) g'( b,) a32( b16.) b32( c16.) \tuplet 3/2 8 { \sbOn c16 d es d c b \sbOff } \gotoBar "5"
    b4 r b'8\p b,~ \sbOn b16 a \tuplet 3/2 8 { a b c } \sbOff
    d8 b, r4 c'16( a) f( e) f4
    r2 r4 r8 f
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Andante"
    r4 f'8\f f, b b'~ b16 g f es
    \tuplet 3/2 8 { d16 c b } b8 f'16( b,) g'( b,) a32( b16.) b32( c16.) \tuplet 3/2 8 { \sbOn c16 d es d c b \sbOff } \gotoBar "5"
    b4 r b'8\p b,~ \sbOn b16 a \tuplet 3/2 8 { a b c } \sbOff
    d8 b, r4 c'16( a) f( e) f4
    r2 r4 r8 f
  }
}

Job = {
  \relative c' {
    \clef tenor
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*2 \gotoBar "5"
    r4 f8 f, b16[ a] b8 c \tuplet 3/2 8 { c16[ d es] }
    d8 f~ f16[ d] c[ b] a4 c8 f
    d d \grace d c8. b16 a8 c f4
  }
}

JobLyrics = \lyricmode {
  Al -- ſo folgt auf Leyd die
  Freud je -- der -- zeit den, der
  ſich zu Gott be -- reith, zu Gott,
}

Schöpffer = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*2 \gotoBar "5"
    R1*3
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \tempoMarkup "Andante"
    b'8. d32 c b8 a g d es f
    b,8. c16 d8 es f d a b \gotoBar "5"
    b d'16.\p c32 b8 a g d es f
    b,8. c16 d8 es f f,16. g32 a8 f
    b g' e c f \hA e d a
  }
}

BassFigures = \figuremode {
  r4. r4 <6>8 <6 5>4
  r2 r8 <6> r4
  r4. r4 <6>8 <6 5>4
  r <6>8 q r2
  r4 <6>4. r4 <6>8
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
        \set Staff.instrumentName = "Job"
        \new Voice = "Job" { \dynamicUp \Job }
      }
      \new Lyrics \lyricsto Job \JobLyrics

      \new Staff {
        \set Staff.instrumentName = "Schöpffer"
        \new Voice = "Schöpffer" { \dynamicUp \Schöpffer }
      }
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \BassoContinuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
