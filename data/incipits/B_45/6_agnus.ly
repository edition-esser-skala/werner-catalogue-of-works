\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Larghetto"
    r8 a'\p d f r e a e
    r16 d b' a g f e d c8 f, r4
    r2 r8 a' b c
    f,16( e) f8 r b e,16( d) e8 r a
    d,16( c) d8 r g c,16( b) c8 r4
    r2 e4. a8~
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Larghetto"
    r4 r8 a'\p e a r a
    f d r c' a f r4
    R1
    r8 d'4 c16 b c4. b16 a
    b4. a16 g a4 r
    r2 r8 e'4 cis8
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Larghetto"
    R1
    r2 c'^\solo
    c4 c8 c c4 c
    d2 c8 c4 c8
    b4 b a2~
    a4 gis a r
  }
}

SopranoLyrics = \lyricmode {
  Qui
  tol -- lis pec -- ca -- ta
  mun -- di: Mi -- se --
  re -- re no --
  _ bis.
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Larghetto"
    R1
    r2 c'^\solo
    c4 c8 c c4 c
    d2 c8 c4 c8
    b4 b a \sbOn a16[ g \tuplet 3/2 8 { f e d] } \sbOff
    c4 h a r
  }
}

AltoLyrics = \lyricmode {
  Qui
  tol -- lis pec -- ca -- ta
  mun -- di: Mi -- se --
  re -- re no -- _
  _ _ bis.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Larghetto"
    a2.^\solo a4
    b2 a
    R1*4
  }
}

TenoreLyrics = \lyricmode {
  A -- gnus
  De -- i.
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Larghetto"
    a'2.^\solo a4
    b2 a
    R1*3
    e4. h'8 c a4 e8
  }
}

BassoLyrics = \lyricmode {
  A -- gnus
  De -- i.

  A -- gnus De -- i, qui
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Larghetto"
    d8-\solo e f d cis a h? cis
    d g e c f a g f
    e d c b a g f16 g a8
    b b' f g a a, e' fis
    g g, d' e f f, c' d
    e d e e, a4 cis
  }
}

BassFigures = \figuremode {
  r1
  <6->4. \once \bassFigureExtendersOn q8 r2
  r1
  r4 <6> <5> <6>
  r <6>2 q4
  <4> <_+> <_!> r
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
}
