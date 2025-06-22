\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key e \minor \time 3/4 \tempoMarkup "Adagio"
    e'8 h e g16 fis e( h' g e)
    fis8 h, fis' a16 g fis( c' a fis)
    g32( fis e8.) h'4 a16 g fis e
    dis8. cis16 h4 r
    gis'8 gis gis gis gis16( h a gis)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key e \minor \time 3/4 \tempoMarkup "Adagio"
    e'8(-. e-. e-. e-. e-. e-.)
    dis(-. dis-. dis-. dis-. dis-. dis-.)
    e(-. e-. e-. e-. e-. e-.)
    \appoggiatura e dis4 r r
    d8 d d d d d
  }
}

ViolinoIII = {
  \relative c' {
    \clef treble
    \key e \minor \time 3/4 \tempoMarkup "Adagio"
    g'8 g g g g g
    fis fis fis fis fis fis
    g g g g g g
    fis4 r r
    h8 h h h h h
  }
}

Continuo = {
  \relative c {
    \clef bass
    \key e \minor \time 3/4 \tempoMarkup "Adagio"
    e4 g e
    h dis h
    e g e
    h'8 h h h a a
    gis4 e e
  }
}

BassFigures = \figuremode {
  r2.
  r
  r
  r
  <6>4 <7 _+>2
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "vl 2"
          \ViolinoII
        }
        \new Staff {
          \set Staff.instrumentName = "3"
          \ViolinoIII
        }
      >>
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
      \new FiguredBass { \BassFigures }
    >>
  >>
}
