\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Andante passato"
    g''4~\f g16( c,) a'( c,) \appoggiatura c8 h4 c8 \tuplet 3/2 8 { c16 d e }
    f( e) f8 d' f, f16( e) e( d) c( g) f( a) \gotoBar "9"
    h8 c16 d \appoggiatura c8 h8.\trill c16 c4 r
    R1*2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Andante passato"
    R1
    r2 g''4~\f g16( c,) a'( c,) \gotoBar "9"
    f,16 g e f \appoggiatura e8 d8.\trill c16 c4 r
    R1
    r8 c'~\p \tuplet 3/2 8 { \sbOn c16 d c h c d \sbOff } e8 c, r4
  }
}

SoliA = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Andante passato"
    R1*2 \gotoBar "9"
    r2 r8 g' \tuplet 3/2 8 { c16[ d e] } d[ c]
    h8 c d16[ h] g[ f] e8 f g c
    a16[ h] c[ g] \appoggiatura g8 f4\trill e r
  }
}

SoliALyrics = \lyricmode {
  Ô süeſ -- ſe
  Lieb, troſt -- rei -- che Bueß, wie ha -- ſtu
  mich be -- gli -- ckhet!
}

SoliB = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Andante passato"
    R1*2 \gotoBar "9"
    R1*2
    r2 r8 c \tuplet 3/2 8 { g'16[ a h] } a[ g]
  }
}

SoliBLyrics = \lyricmode {
  Der See -- "len -"
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Andante passato"
    c8 d e f g f e a
    d, a h g c d e f \gotoBar "9"
    g c, g' g, c d e f
    g a h h, c d e c
    f e d g, c e h c
  }
}

BassFigures = \figuremode {
  r1
  r8 <6> q <7>4. <6>8 q
  <7>4 <4>8 <3>4. <6>8 q
  r1
  r4 <7>8 q4. <6>8 q
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
        \set Staff.instrumentName = "St: Magdalena"
        \new Voice = "SoliA" { \dynamicUp \SoliA }
      }
      \new Lyrics \lyricsto SoliA \SoliALyrics

      \new Staff {
        \set Staff.instrumentName = "St: Michael"
        \new Voice = "SoliB" { \dynamicUp \SoliB }
      }
      \new Lyrics \lyricsto SoliB \SoliBLyrics
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
