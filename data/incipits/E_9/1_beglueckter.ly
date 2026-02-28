\version "2.24.2"
\include "header.ly"

ViolinoIa = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Largo"
    \partial 8 c'8\f f \tuplet 3/2 8 { a16 b c } \appoggiatura c8 b8.\trill a32 g a16( f) f( c) c( a) a8
    r2 r4 r8 a' \gotoBar "8"
    f,4 r r2
    r16 c'\p f( e) f8 a r2
    R1
  }
}

ViolinoIIa = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Largo"
    \partial 8 c'8\f \sbOn \tuplet 3/2 8 { a16 g f f' g a } \sbOff \appoggiatura a8 g8.\trill f32 e f16( c) c( a) a( f) f8
    r2 r4 r8 c' \gotoBar "8"
    f,4 r r2
    r16 a b8 c a r2
    R1
  }
}

ViolinoIb = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Largo"
    \partial 8 r8 r2 r4 r8 c
    f \tuplet 3/2 8 { a16 b c } \appoggiatura c8 b8.\trill a32 g a16( f) c'( a) f'( c) a'8 \gotoBar "8"
    f,4 r r2
    r4 r8 c' \sbOn \tuplet 3/2 8 { d16 c b } f'-! f-! \tuplet 3/2 8 { c b a } f'-! f-!
    \tuplet 3/2 8 { b, a g } g'-! g-! \sbOff a,4 r2
  }
}

ViolinoIIb = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Largo"
    \partial 8 r8 r2 r4 r8 c
    \sbOn c16( a) \tuplet 3/2 8 { f' g a } \sbOff \appoggiatura a8 g8.\trill f32 e f16( c) a'( f) c'( a) f'8 \gotoBar "8"
    f,4 r r2
    r4 r8 f~ f d'16 f, f8 c'16 f,
    d8 c c4 r2
  }
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 4/4 \tempoMarkup "Largo" \autoBeamOff
    \partial 8 r8 R1*2 \gotoBar "8"
    r4 r8 c^\solo f16[ c] a[ g] f8 \tuplet 3/2 8 { g16[ a b]
    a[ g f] } f8 r c' d f c \tuplet 3/2 8 { f16[ e d] }
    \appoggiatura c8 b8.\trill b16 a8 c f d16[ c] h8 c
  }
}

TenoreLyricsA = \lyricmode {
  \set stanza = "1. "
  Be -- glück -- ter E -- dens
  Gar -- ten, da -- rin die gröſ -- ſte
  Luſt -- bar -- keit mit all er -- wün -- ſchter
}

TenoreLyricsB = \lyricmode {
  \set stanza = "2. "
  Diß mue -- ſte ſeyn ge --
  ro -- chen, die -- weil hier -- durch der
  höch -- ſte Gott in ſeim Be -- felh nur
}

TenoreLyricsC = \lyricmode {
  \set stanza = "3. "
  Doch wur -- de Frid ge --
  trof -- fen, die -- weil ſchon die Barm --
  her -- zig -- keit be -- ſig -- te die "Ge -"
}

TenoreLyricsD = \lyricmode {
  \set stanza = "4. "
  Nun kham es auf dem
  Wil -- len bey ei -- ner Ed -- len
  Jung -- frau rein die ſolt ein Mit -- "ge -"
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Largo"
    \partial 8 r8 f8 f, c' c, f4 r
    f'8\p f, c' c, f4 r8 f'\f \gotoBar "8"
    f, f' c a f f' a, c
    f g a f b b, a' f
    g e f e d f g e
  }
}

BassFigures = \figuremode {
  r8 r4 <6 4>8 <5 3> r2
  r4 <6 4>8 <5 3> r2
  r4 <\t>2 <6>4
  r1
  r2. <_!>8 <6>
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff \with { \smallGroupDistance } <<
        \set GrandStaff.instrumentName = \markup \center-column { "vl" "s. sord." }
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoIa
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoIIa
        }
      >>
      \new GrandStaff <<
        \set GrandStaff.instrumentName = \markup \center-column { "vl" "con sord." }
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoIb
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoIIb
        }
      >>
    >>
    \new ChoirStaff \with { \setGroupDistance #21 #21 } <<
      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyricsA
      \new Lyrics \lyricsto Tenore \TenoreLyricsB
      \new Lyrics \lyricsto Tenore \TenoreLyricsC
      \new Lyrics \lyricsto Tenore \TenoreLyricsD
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
