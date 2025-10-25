\version "2.24.2"
\include "header.ly"

\layout {
  \context {
    \Lyrics
    \override StanzaNumber.font-series = #'medium
    \override StanzaNumber.font-size = #-1
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 3/4 \tempoMarkup "Larghetto"
      \once \override Staff.TimeSignature.style = #'single-digit
    f16([\p^\conSord a8.) a16( c8.) c16( f8.)]
    f8.\trill e32 d c8( f) a,( b)
    c8.\trill d32 e f8( c) e( g)
    f( c) c2~\trill
    c4~ c8 e f( f,)
    f( c') \tuplet 3/2 4 { b a g a g f }
    e16([ g8.) f16( a8.) g16( b8.)]
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 3/4 \tempoMarkup "Larghetto"
      \once \override Staff.TimeSignature.style = #'single-digit
    r4^\conSord c16([\p f8.) f16( a8.)]
    a8 c16( b) a4 f~
    f8( a) c( a) g( b)
    \tuplet 3/2 4 { a g f f g a g a b
    a g f } e( c') a( f')
    c( f,) e( b') \tuplet 3/2 4 { a g f }
    e16([ g8.) f16( a8.) g16( e8.)]
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 3/4 \tempoMarkup "Larghetto" \autoBeamOff
      \once \override Staff.TimeSignature.style = #'single-digit
    r4 r c'^\solo
    f c a8[ b]
    c4 f,8[ a] g[ b]
    \tuplet 3/2 4 { a[ g f] } f4 g
    a g8[ a] f4
    c' b8[ g] a[ f]
    g2 g4
  }
}

SopranoLyricsA = \lyricmode {
  \set stanza = "1. "
  Waß
  helf -- fen mir
  welt -- li -- che
  Freu -- den, die
  dau -- ren ein
  we -- ni -- ge
  Zeit, ſie
}

SopranoLyricsB = \lyricmode {
  \set stanza = "2. "
  Wer
  wird unß von
  La -- ſtern be --
  ſchü -- zen, wer
  hilfft wohl auß
  E -- wi -- ger
  Noth? Wan
}

SopranoLyricsC = \lyricmode {
  \set stanza = "3. "
  Wan
  dan di -- ße
  Jung -- frau ſo
  kräff -- tig ſich
  al -- ler -- ley
  Sün -- der nihmt
  an, im
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 3/4 \tempoMarkup "Larghetto"
      \once \override Staff.TimeSignature.style = #'single-digit
    f4 c a
    f2 f'4
    a,2 c4
    f a e
    f c d
    a g f
    c' d e
  }
}

BassFigures = \figuremode {
  r4 <\t>2
  r2.
  <6>
  r2.
  r
  <6>4 q2
  r2.
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
    \new ChoirStaff \with { \setGroupDistance #17 #17 } <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyricsA
      \new Lyrics \lyricsto Soprano \SopranoLyricsB
      \new Lyrics \lyricsto Soprano \SopranoLyricsC
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
