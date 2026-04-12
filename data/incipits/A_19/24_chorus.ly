\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Tempo ordinario"
    g'16( h) h( d) d( g) g( h) c( g) g( e) e( g) c( e,)
    e( d) d( g) g( h) h( d,) c( c') c( a) a( fis) fis( a)
    d,( g) d( e) \sbOn \tuplet 3/2 8 { f\trill e \hA f f\trill e \hA f }r e8 fis16 \tuplet 3/2 8 { g\trill fis g g\trill fis g
    fis\trill e fis fis\trill e fis g\trill fis g a\trill g a h\trill a h a\trill g a g\trill fis g h\trill a h } \sbOff
    a(\p d) c( h) a( h) a( g) fis( h) a( g) fis( g) fis( e)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Tempo ordinario"
    r16 g' g( h) h( d) d( g) \sbOn \tuplet 3/2 8 { e( d e) } e( c) \sbOff c( e) e( c)
    c( h) h( d) d( g) g( h,) a( a') a8 r16 d, \tuplet 3/2 8 { c[ h c] }
    c( h) h( c) \sbOn \tuplet 3/2 8 { d\trill c d d\trill c d } \sbOff r g, c d \sbOn \tuplet 3/2 8 { e\trill d e e\trill d e
    a,\trill g a a\trill g a d\trill c d d\trill c d d\trill c d fis\trill e fis d\trill c d g\trill fis g } \sbOff
    fis4\p r16 d c( h) a( d) c( h) a( h) a( g)
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
    r8 d' d g e8. e16 g8 e
    e d r4 c8. c16 a'8 c,
    c h r h c4 r8 cis
    d d d d d4. d8
    d4 r r2
  }
}

SopranoLyrics = \lyricmode {
  So ſey dir Dank ge -- ſagt vor
  al -- len, Dank ge -- ſagt vor
  al -- len, ô Held! ô
  Held! der Hel -- den Sie -- ges --
  gott;
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
    r8 g' g h g8. g16 g8 g
    g g r4 e8. e16 d8 d
    d d r d e4 r8 e
    fis! fis g a g[ fis] g4
    fis r r2
  }
}

AltoLyrics = \lyricmode {
  So ſey dir Dank ge -- ſagt vor
  al -- len, Dank ge -- ſagt vor
  al -- len, ô Held! ô
  Held! der Hel -- den Sie -- ges --
  gott;
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
    r8 h h g c8. c16 e8 c
    c h r4 a8. a16 a8 a
    a g r g g4 r8 a
    a a h d h[ a] h4
    a r r2
  }
}

TenoreLyrics = \lyricmode {
  So ſey dir Dank ge -- ſagt vor
  al -- len, Dank ge -- ſagt vor
  al -- len, ô Held! ô
  Held! der Hel -- den Sie -- ges --
  gott;
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
    r8 g' g g g4. g8
    g4 r g8. g16 fis8 fis
    g g r g c,4 r8 a
    d d' h fis g[ d] h[ g]
    d'4 r r2
  }
}

BassoLyrics = \lyricmode {
  So ſey dir Dank ge --
  ſagt, Dank ge -- ſagt vor
  al -- len, ô Held! ô
  Held! der Hel -- den Sie -- ges --
  gott;
}

Continuo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Tempo ordinario"
    g'4. g8 g g g g
    g g g g g g fis fis
    g g r g, c4 r8 a
    d d' h fis g d h g
    d'4 r r2
  }
}

BassFigures = \figuremode {
  r2 <6 4>
  q8 <5 3>4. <4 2>4 <6>8 <5>
  <4> <3>4 <7!>2 <7 _+>8
  <_+>4 <6>8 r4 <_+>8 r4
  r1
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
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
