\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key d \major \time 2/4 \tempoMarkup "Allegro"
    \partial 8 a'8 d e fis gis
    a4 h8 gis16( e)
    a8 r h,\p gis16( e)
    a4 r8 a\f
    d e fis gis
    a4 h8 gis16( e)
    a8 r h,\p gis16( e)
    a8 r r a'\f
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key d \major \time 2/4 \tempoMarkup "Allegro"
    \partial 8 a'8 d e fis gis
    a4 h8 gis16( e)
    a8 r gis,\p h16( \hA gis)
    a4 r8 a\f
    d e fis gis
    a4 h8 gis16 e
    a8 r gis,\p h16( \hA gis)
    a4 r8 fis'\f
  }
}

Viola = {
  \relative c' {
    \clef alto
    \twofourtime \key d \major \time 2/4 \tempoMarkup "Allegro"
    \partial 8 a'8 fis4 r
    e8( a) gis( h)
    cis4 e,\p
    a, r8 a\f
    d8 e fis gis
    a4 gis8( h)
    cis4 e,\p
    a, r8 a'\f
  }
}

Organo = {
  \relative c {
    \clef bass
    \twofourtime \key d \major \time 2/4 \tempoMarkup "Allegro"
    \partial 8 << { a'8 d4 } \\ { a,8 d4 } >> r
    cis e
    a, r
    r r8 a^\markup \remark "alla 8va"
    d e fis gis
    a4 e
    a, r
    r8 a' a,4
  }
}

BassFigures = \figuremode {
  r8 r2
  <6>4 <_+>
  r2
  r
  r
  r4 <_+>
  r2
  r8 <_+>4.
}

\score {
  <<
    \new StaffGroup \with { \smallGroupDistance } <<
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
