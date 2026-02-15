\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 3/2 \tempoMarkup "Larghissimo"
    R1.
    r4 d'( es) e( f) fis(
    g8) f es4 d2. cis4
    r d( cis) c( h) b(
    a8) g a4 r c2 d8 c
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 3/2 \tempoMarkup "Larghissimo"
    g'4 a( b) h( c) cis(
    d2) c4( b) a( d)
    b4. b8 a4 d, g8( fis) g4
    fis( d) e( \hA fis) g8( \hA fis) g4~
    g fis g8( \hA fis) g4 a8( g) a4
  }
}

Organo = {
  \relative c {
    \clef bass
    \key g \minor \time 3/2 \tempoMarkup "Larghissimo"
    g2 g'4 f es2
    d r r
    r4 g( fis) f( e) es(
    d2) r r
    r4 d( es!) e( f) fis
  }
}

BassFigures = \figuremode {
  r2. <4!>4 <6> <6\\>
  <_+>1.
  r4 <6-> <6>2 <7>4 <6\\>
  <_+>1.
  r4 <_+> <7> <6> <5> <6>
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff \with { \smallGroupDistance } <<
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
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
