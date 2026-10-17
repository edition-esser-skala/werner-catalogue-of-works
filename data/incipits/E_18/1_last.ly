\version "2.24.2"
\include "header.ly"

Chalumeau = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Largo"
    r4 f'~ f32 d16. b32 f'16. g32( es16.) d32( c16.) \gotoBar "6"
    a16 c b g' \appoggiatura d8 c8.\trill b16 b4 r
    R1*3
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Largo"
    b''8^\conSord f16 es \sbOn \tuplet 3/2 8 { d es f es d c d c b } b8 r4 \sbOff \gotoBar "6"
    c16 a b4 a8 b16 d,8 f16 b d f8
    r4 r8 f~ f16 es d c b d f b
    g a b f es( d) es8 d4 r
    r r16 d c b a( g) f( e) f4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Largo"
    \sbOn \tuplet 3/2 8 { d'16^\conSord es f } d c \tuplet 3/2 8 { b c d c b a } b8 f r4 \sbOff \gotoBar "6"
    f8. g16 f8 f f16 b,8 d16 f b d8
    r4 r8 a b8. c16 d( b) d( f)
    b,( c) d8 g, a16.\trill g64( a) b4 r
    r r16 d c b a( g) f( e) f4
  }
}

Alto = {
  \relative c' {
    \clef alto
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    R1 \gotoBar "6"
    r2 r4 r8 f^\solo
    b f f16[ c] d[ es] d8 d16[ es] f8 b
    g16[ a] b[ f] \appoggiatura f8 es4\trill d8 b f' g16[ a]
    b[ a] g[ f] e[ d] c[ b'] a[ g] f8 r a
  }
}

AltoLyricsA = \lyricmode {
  \set stanza = "1. "
  Laſt
  ab von eu -- ren Trau -- ren ihr ge --
  kränck -- te Her -- zen, wie lang, wie
  lang ſoll an noch dau -- ren ſo
}

AltoLyricsB = \lyricmode {
  \set stanza = "2. "
  Die
  Mut -- ter un -- ſers Her -- ren iſt die
  ſtar -- cke Stü -- zen, ſie wird, ſie
  wird euch gwiß er -- hö -- ren, vor
}

AltoLyricsC = \lyricmode {
  \set stanza = "3. "
  So
  laſ -- ſet uns dan ge -- hen weill ſie
  ſchon ganz wil -- lig, all den, all
  de -- nen bey -- zu -- ſte -- hen die
}

Organo = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \tempoMarkup "Largo"
    b8 b'4 f8 b, d es f \gotoBar "6"
    es8 d16 es f8 f, b4 r
    b8 d a f b b' d, b
    es d c f, b b' a f
    << { g } \\ { g, b c e } >> f f16 g a8 f
  }
}

BassFigures = \figuremode {
  r1
  <4 2>8 <6> <6 4> <3> r2
  r1
  r4 <7>8 q r2
  r4 <_!>2.
}

\score {
  <<
    \new Staff {
      \set Staff.instrumentName = "chalumeau"
      \Chalumeau
    }
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
    \new ChoirStaff \with { \setGroupDistance #18 #18 } <<
      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyricsA
      \new Lyrics \lyricsto Alto \AltoLyricsB
      \new Lyrics \lyricsto Alto \AltoLyricsC
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
