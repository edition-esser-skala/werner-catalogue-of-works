\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Adagio"
    g'16.\f b32( a16.) c32( b16.) d32( c16.) es32( d16.) f32( es16.) g32( f16.) as32( g16.) b32(
    as16.) f32( es16.) d32 f16. d32 c16. h32 \sbOn c8 \tuplet 3/2 8 { c'16 h c g\trill f g es d es
    c\trill b c g\trill f g e\trill d \hA e c\trill b c } \kneeBeam as8 \tuplet 3/2 8 { c''16\trill b c as\trill g \hA as f\trill e f
    es\trill d es c\trill b c a!\trill g a fis\trill e? \hA fis } \sbOff d16 g, g g g g g g
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Adagio"
    r4 g'16.\f b32( a16.) c32( h16.) d32( c16.) es32( d16.) f32( es16.) g32(
    f16.) d32 c16. h32 d16. \hA h32 a!16. g32 \sbOn c8 \tuplet 3/2 8 { c'16 h c g\trill f g es\trill d es
    c\trill b c g\trill f g e\trill d \hA e c\trill b c } \kneeBeam as8 \tuplet 3/2 8 { c''16\trill b c as\trill g \hA as f\trill e f
    es\trill d es c\trill b c a!\trill g a fis\trill e? \hA fis } \sbOff d16 g, g g g g g g
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1
    h'2^\tutti c4 r
    c2 c4 r
    c2 h8 d d es
  }
}

SopranoLyrics = \lyricmode {
  San -- ctus,
  san -- ctus,
  san -- ctus Do -- mi -- nus
}

Alto = {
  \relative c' {
    \clef alto
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1
    d2^\tutti es4 r
    g2 f4 r
    es2 d4 r
  }
}

AltoLyrics = \lyricmode {
  San -- ctus,
  san -- ctus,
  san -- ctus
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1
    as2^\tutti g4 r
    g4 c as r
    a2 h8 h h c
  }
}

TenoreLyrics = \lyricmode {
  San -- ctus,
  san -- _ ctus,
  san -- ctus Do -- mi -- nus
}

Basso = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1
    f2^\tutti es4 r
    e2 f4 r
    fis2 g4 r
  }
}

BassoLyrics = \lyricmode {
  San -- ctus,
  san -- ctus,
  san -- ctus
}

Organo = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \tempoMarkup "Adagio"
    g'8-\tutti r r4 g8 r r4
    f2 es4 r
    e2 f4 r
    fis2 g4 r
  }
}

BassFigures = \figuremode {
  r2 <_!>
  <4! _-> <6>
  q <_->
  <7 5> <_!>
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
        \set Staff.instrumentName = \markup \center-column { "A" "trb 1" }
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "T" "trb 2" }
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
