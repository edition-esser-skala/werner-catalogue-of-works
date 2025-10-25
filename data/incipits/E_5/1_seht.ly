\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    r16 g'' e16. c32 g16. e'32 c16. g32 a4 r
    r16 a'8 f d f16 c4 r
    r2 r16 a'( c16.) f,32( a16.) c,32( f16.) a,32(
    d4) r r16 h'-! fis-! dis-! h-! fis-! dis-! \hA fis-!
    h,4 r r2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    r16 e' c16. g32 e16. c'32 g16. e32 e4 r
    r16 f'8 d a d16 g,4 r
    r2 r16 f'( a16.) c,32( f16.) a,32( c16.) f,32(
    a4) r r16 fis'-! dis-! h-! \sbOn fis-! dis-! \tuplet 3/2 8 { h cis? \hA dis } \sbOff
    g,4 r r2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "Recitativo" \autoBeamOff
    c'4^\solo r r8 a16 cis e \hA cis a g'
    f4 r r8 g, c e
    g g, b c a a r a
    d fis a d, h8. fis16 fis4
    r8 g g h d d f e
  }
}

SopranoLyrics = \lyricmode {
  Seht! Wie der ſtol -- zen Schlan -- gen
  Haubt, die durch die
  lan -- ge Erb -- ſünds -- ket -- ten den
  Theil des Him -- mels unß be -- raubt,
  von ei -- ner Jung -- frau wird "zer -"
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    c4-\solo r cis r
    d r e2~
    e f
    fis dis
    e h
  }
}

BassFigures = \figuremode {
  %tacet
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
