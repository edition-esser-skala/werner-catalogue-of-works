\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Tempo ordinario" \autoBeamOff
    R1
    r2 a'
    g a
    d, r
    c' b
  }
}

SopranoLyrics = \lyricmode {
  Sal --
  _ _
  ve,
  sal \hy
}

Alto = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Tempo ordinario" \autoBeamOff
    R1
    r2 a'
    g a
    d, r
    c' b
  }
}

AltoLyrics = \lyricmode {
  Sal --
  _ _
  ve,
  sal \hy
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Tempo ordinario" \autoBeamOff
    d16[^\solo d32 e f16 g] a[ a32 b c16 a] d[ b,32 c d16 e] f[ f32 g a16 f]
    \sbOn \tuplet 3/2 8 { b16[ a b } c d] \sbOff c[ g e c] f4 r
    R1
    r16 d32[ e f16 g] a32([ b) c16 b a] \sbOn b64([ c d16.) g,64( a b16.)] \sbOff e,16[ g] c[ b]
    a8 f r4 r2
  }
}

BassoLyrics = \lyricmode {
  Sal -- _ _ _
  _ _ ve,

  sal -- _ _ ve Re --
  gi -- na,
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Tempo ordinario"
    d8-\solo d' c f, b, b' a f
    g d e c f a g f
    c' g16 f e8 d cis a a' g
    f d16 e fis8 d g e16 d c8 e
    f a16 g a8 f g d g f
  }
}

BassFigures = \figuremode {
  r4 <6>2.
  <_->8 <6> q2.
  r1
  r
  r2 <_->
}

\score {
  <<
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
