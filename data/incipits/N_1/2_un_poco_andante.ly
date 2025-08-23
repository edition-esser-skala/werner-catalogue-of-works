\version "2.24.2"
\include "header.ly"

ViolinoPrincipale = {
  \relative c' {
    \clef treble
    \twofourtime \key d \minor \time 2/4 \tempoMarkup "Un poco andante"
    d'8 a16 g f8 e
    f d r a''
    a16( g) g8 r f,\p
    f16( e) e8 r4
    c''!8\f a16 g f8 g
    a f r a
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key d \minor \time 2/4 \tempoMarkup "Un poco andante"
    d'8 a16 g f8 e
    f d r a''
    a16( g) g8 r f,\p
    f16( e) e8 r4
    c''!8\f a16 g f8 g
    a f r a
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key d \minor \time 2/4 \tempoMarkup "Un poco andante"
    f8. e16 d8 cis
    d4 r8 f'
    f16( e) e8 r d,
    d16( cis) cis8 r4
    a'8 c! f e
    f16( e) f8 r c16( f)
  }
}

Viola = {
  \relative c' {
    \clef alto
    \twofourtime \key d \minor \time 2/4 \tempoMarkup "Un poco andante"
    a'4 r8 a,
    a f16 a d4
    cis d
    a r
    c!4. c8
    c a16 c f8 f,
  }
}

Organo = {
  \relative c {
    \clef bass
    \twofourtime \key d \minor \time 2/4 \tempoMarkup "Un poco andante"
    d4. a8
    d,4 \clef soprano d''^\aTre
    cis d
    a r
    \clef bass f4. c8
    f,4 \clef soprano f''8 f,
  }
}

BassFigures = \figuremode {
  r4. <_+>8
  r2
  <6 4>8 <5 3>4.
  <6 4>8 <5 _+>4.
  r2
  r
}

\score {
  <<
    \new Staff {
      \set Staff.instrumentName = "vl princ"
      \ViolinoPrincipale
    }
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
        \set Staff.instrumentName = "vla"
        \Viola
      }
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
