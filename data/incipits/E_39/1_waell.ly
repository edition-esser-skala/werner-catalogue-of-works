\version "2.24.2"
\include "header.ly"

Oboe = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    \partial 8 g'8 c( g) e' c16( e) g4\trill a8. h32 c
    g8( e) c g' g2~
    g8( e) c g' g2 \gotoBar "10"
    e8 g a d, e4 r
    R1*2
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    \partial 8 g'8 c g16( c) e8 c16( e) g8( e) c( a')
    g( e) c( g') f16( g) e( g) f( g) d( f)
    e8 c4 g8\p f16( g) e( g) f( g) d( f) \gotoBar "10"
    e'32( g16.) c,32( g'16.) a32( f16.) d32( h16.) c8 c' c,4
    R1
    g'16(\p e) c( g) e4 r2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    \partial 8 g'8\f e e16( g) c8 e,16( g) c4. c16( f)
    e8 c4 e8 d16( e) c( e) d( e) h( d)
    c8 g e e\p d16( e) c( e) d( e) h( d) \gotoBar "10"
    e'32( g16.) c,32( g'16.) a32( f16.) d32( h16.) c8 c' c,4
    R1
    e16(\p c) g( e) c4 r2
  }
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    \partial 8 r8 R1*3 \gotoBar "10"
    r2 r4 r8 g
    c g e' c g'16[ f g8] a16[ g a8]
    g4 r8 g f16[ e] f8 d' f,
  }
}

AltoLyricsA = \lyricmode {
  \set stanza = "1."
  Wäll
  heut dä Tag ſo freu -- den --
  reich ſo ſtim -- mär all mit
}

AltoLyricsB = \lyricmode {
  \set stanza = "2."
  Mär
  la -- ßen unß -- ri Stadt -- leuth
  gehn mit ih -- rä Po -- "li -"

}

AltoLyricsC = \lyricmode {
  \set stanza = "3."
  Äs
  gibt ja Streit jezt in __ dä __
  Stadt ſo vill und man -- "cher -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    \partial 8 r8 R1*3 \gotoBar "10"
    r2 r4 r8 g
    c g e' c e16[ f e8] c[ f]
    e4 r8 e d16[ c] d8 h d
  }
}

TenoreLyricsA = \lyricmode {
  \set stanza = "1."
  Wäll
  heut dä Tag ſo freu -- den --
  reich ſo ſtim -- mär all mit
}

TenoreLyricsB = \lyricmode {
  \set stanza = "2."
  Mär
  la -- ßen unß -- ri Stadt -- leuth
  gehn mit ih -- rä Po -- "li -"
}

TenoreLyricsC = \lyricmode {
  \set stanza = "3."
  Äs
  gibt ja Streit jezt in __ dä __
  Stadt ſo vill und man -- "cher -"
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    \partial 8 r8 c4 r8 c e c f f,
    c'4 r8 c g'4 g,
    c r8 c-\tasto g'4 g, \gotoBar "10"
    c8 e f g c,4 r
    c\p r c'8 c, f f,
    c'4 r g' g,
  }
}

BassFigures = \figuremode {
  r8 r1
  r2 <7 5>8 <6 4> <7 5> <5 3>
  r1
  r4 <6 5>2.
  r1
  r2 <7>
}

\score {
  <<
    \new Staff \with { \smallStaffDistance } {
      \set Staff.instrumentName = \markup \center-column { "ob" "solo" }
      \Oboe
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

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyricsA
      \new Lyrics \lyricsto Tenore \TenoreLyricsB
      \new Lyrics \lyricsto Tenore \TenoreLyricsC
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
