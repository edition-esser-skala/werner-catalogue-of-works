\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Andante moderato"
    \mvDl d'8\trill d,16. d'32 \sbOn cis16. e32 a( g f e) \sbOff f16 a32 g f e d c b a g f g f e d
    e16 g'32 f e d c b a g f e f e d c d16. d'32 b16. d32 \sbOn g,16.\trill b64 g e16.\trill g64 e \sbOff
    cis16. a'32 f16. d32 a'8 a, d4 r
    R1
    r32 d e f g a b c d16 a f d r2
    R1
    r2 d'8\trill d,16. d'32 c!16 e32 d c16 b
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Andante moderato"
    \mvDl d'8\trill d,16. d'32 \sbOn cis16. e32 a( g f e) \sbOff f16 a32 g f e d c b a g f g f e d
    e16 g'32 f e d c b a g f e f e d c d16. d'32 b16. d32 \sbOn g,16.\trill b64 g e16.\trill g64 e \sbOff
    cis16. a'32 f16. d32 a'8 a, d4 r
    R1
    r32 d e f g a b c d16 a f d r2
    R1
    r2 d'8\trill d,16. d'32 c!16 e32 d c16 b
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante moderato"
    R1*2
    r2 a'4^\tutti b
    a g a2
    d, f4 g
    a g f e
    d cis d r
  }
}

SopranoLyrics = \lyricmode {
  Ky -- _
  ri -- _ e __
  _ e -- _
  lei -- _ _ _
  _ _ son.
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante moderato"
    R1*2
    r2 a'4^\tutti b
    a g a2
    d, f4 g
    a g f e
    d cis d r
  }
}

AltoLyrics = \lyricmode {
  Ky -- _
  ri -- _ e __
  _ e -- _
  lei -- _ _ _
  _ _ son.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante moderato"
    R1*2
    r2 a4^\tutti b
    a g a2
    d, f4 g
    a g f e
    d cis d r
  }
}

TenoreLyrics = \lyricmode {
  Ky -- _
  ri -- _ e __
  _ e -- _
  lei -- _ _ _
  _ _ son.
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante moderato"
    R1*2
    r2 a'4^\tutti b
    a g a2
    d, f4 g
    a g f e
    d cis d r
  }
}

BassoLyrics = \lyricmode {
  Ky -- _
  ri -- _ e __
  _ e -- _
  lei -- _ _ _
  _ _ son.
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Andante moderato"
    d8-\solo f a cis, d d' g, b
    c, c' f, a b, g' e cis
    a d a' a, d, d' g, c
    f, f' e d cis a a' g
    f g f e d c b c
    f ,f' b, c d f g a
    b g a a, d f e c'
  }
}

BassFigures = \figuremode {
  r4 <_+>2.
  r1
  r2.. <3>8
  r1
  <6>2. <6 5>4
  r <6>2.
  r4 <_+>2.
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
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
