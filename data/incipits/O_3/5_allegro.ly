\version "2.24.2"
\include "header.ly"

#(add-simple-time-signature-style 'rotCC
   (lambda (fraction)
     (make-line-markup
       (list
         (make-rotate-markup 180 (make-musicglyph-markup "timesig.C44"))
         (make-musicglyph-markup "timesig.C44")))))

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key g \minor \time 2/4 \tempoMarkup "Allegro"
      \override Score.TimeSignature.style = #'rotCC
    g'8 es' d d,
    g4 g'
    es8 d16 c b8 a
    b a g4
    b8(\p es) d( cis)
    d, a' d d,
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key g \minor \time 2/4 \tempoMarkup "Allegro"
      \override Score.TimeSignature.style = #'rotCC
    g'8 es' d d,
    g4 g'
    es8 d16 c b8 a
    b a g4
    b8(\p es) d( cis)
    d, a' d d,
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \twofourtime \key g \minor \time 2/4 \tempoMarkup "Allegro"
      \override Score.TimeSignature.style = #'rotCC
    g'4 f
    es8 d16 c b8 es
    c a d d,
    << { g' a b a } \\ { g,4 s } >>
    g'4 r
    fis\p f
  }
}

BassFigures = \figuremode {
  r4 <6>
  r q
  <6 5> <6 4>8 <5 _+>
  r4 <6>
  r2
  <6>4 <\t>
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
        \set Staff.instrumentName = "bc"
        \BassoContinuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
